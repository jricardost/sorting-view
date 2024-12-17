public class BaseView implements Runnable {

  Thread thread;

  public static final int SORT_MODE_NORMAL = 0;
  public static final int SORT_MODE_CLOCKED = 1;
  public static final int SORT_MODE_HISTORY = 2;
  public static final int SORT_MODE_VISUAL = 3;

  final int SORTED_COLOR   = 0xFF808080;
  final int SWEEP_COLOR    = 0xFFFFE900;
  final int SELECTED_COLOR = 0xFFFF0000;
  final int EXTRA_COLOR    = 0xFFFF00FF;

  //Desenho
  int x;
  int y;
  int w;
  int h;

  protected int vIndex1 = -1; //carry
  protected int vIndex2 = -1; //begin / compare1
  protected int vIndex3 = -1; //end / compare2
  protected int min;
  protected int max;

  protected int paddingTop = 20;
  protected int paddingBottom = 20;

  protected int timingInterval;

  //Controle

  protected boolean step = false;
  protected boolean sorted = false;
  protected boolean noTick = false;

  public int sortMode = SORT_MODE_NORMAL;

  protected int sweepIndex = -1; //current index
  protected int sortedIndex = -1; //last index;
  protected int selectedIndex = -1; //selected index


  //Dados
  protected String name = "?";
  public int[] values;
  protected long elapsedTime;
  protected int comparisons;
  protected int swaps;

  /* --- METODOS --- */

  public BaseView(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    name = this.getClass().getSimpleName();
  }

  public BaseView(int[] values, int x, int y, int w, int h) {
    this(x, y, w, h);
    setValues(values);
  }

  private void init() {
    comparisons = 0;
    swaps = 0;
    min = MAX_INT;
    max = MIN_INT;
    for (int val : values) {
      if (val < min) min = val;
      if (val > max) max = val;
    }
    sorted = false;
    timingInterval = (75000000 / (values.length));
  }

  public void setValues(int[] values) {
    this.values = values.clone();
    init();
  }

  /* --- DRAWING --- */

  public void draw() {

    pushStyle();

    drawBackground();
    drawValues();
    drawText();

    popStyle();
  }




  void drawBackground() {
    fill(0);
    stroke(0);
    rect(x, y, w, h);
  }


  public void drawValues() {

    float bx;
    float bw = (values.length < w) ? w / (values.length) : 1;
    float bh;

    pushStyle();
    colorMode(HSB, values.length, 100, 100);
    noStroke();

    for (int n = 0; n < values.length; n++) {

      bx = map(n, 0, values.length, 0, w);
      bh = map(values[n], min, max, 1, h - (paddingTop + paddingBottom) - 10);

      fill(values[n], 255, 255); 
      drawBar(x + bx, y + (h - bh) - 10, bw, bh);

      if (!sorted) {      
        if (n == vIndex1) {
          fill(#FFFFFF); 
          rect(x + bx + 2, y + h - 10, bw, 10);
        }
        if (n == vIndex2) {
          fill(#AFAFAF); 
          rect(x + bx + 2, y + h - 10, bw, 10);
        }
        if (n == vIndex3) {
          fill(#555555); 
          rect(x + bx + 2, y + h - 10, bw, 10);
        }
        //if (sortedIndex > 0 && n < sortedIndex) fill(color(values[n], 255, 255)) else
      }
    }
    popStyle();
  }
  
  void drawBar(float x, float y, float w, float h){
    rect(x, y, w, h);
  }

  void drawText() {
    textSize(20);
    fill(#FFFFFF);
    textAlign(LEFT, TOP);
    //text(String.format("Concluído: %.4fms [%dns]", elapsedTime / 1000000f, elapsedTime), x + 10, y + 10);
    text(String.format("%-13s [C: %6d | T: %6d] %s ", name, comparisons, swaps, (sorted) ? "Concluído!" : ""), x + 10, y + 10);
  }


  /* --- TIMER E EXECUÇÃO --- */

  void sort() {
    thread = new Thread(this);
    thread.start();
  }

  void normalSort() {
  };

  public void run() {
    normalSort();
    sorted = true;
  }

  public final void stop() {
    try {
      thread.interrupt();
    } 
    catch (Exception e) {
    }
  }

  final void tick() {
    step = true;
  }

  public void timeWait() {

    //long nano = System.nanoTime();

    //while (System.nanoTime() - nano < timingInterval) {
    //};   
    try {
      while (!step) {
        delay(1);
      }
      step = false;
    } catch (Exception e){}
  }
}
