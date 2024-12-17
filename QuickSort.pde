public class QuickSort extends BaseView {

  public QuickSort(int x, int y, int w, int h) {
    super(x, y, w, h);
  }

  public QuickSort(int[] values, int x, int y, int w, int h) {
    super(values, x, y, w, h);
    //history = new History();
  }

  /* --- ALIASES --- */

  public void normalSort() {
    comparisons = 0;
    swaps = 0;
    sorted = false;
    _sort(values, 0, values.length - 1);
  }


  /* --- IMPLEMENTAÇÃO --- */

  //Executa cada passo em 1 frame da visualização
  public void _sort(int[] values, int begin, int end) {

    if (begin >= end) return;

    int sweepIndex1 = 0;
    int sweepIndex2 = begin - 1;
    int tempVar;

    for (sweepIndex1 = begin; sweepIndex1 < end; sweepIndex1++) {

      vIndex1 = sweepIndex1;
      
      if (values[sweepIndex1] <= values[end]) {

        sweepIndex2++;      
        
        tempVar = values[sweepIndex1];
        values[sweepIndex1] = values[sweepIndex2];
        values[sweepIndex2] = tempVar;

        vIndex2 = sweepIndex2;
        swaps++;      
        //timeWait();
      }

      timeWait(); //1
      comparisons++;
    }

    vIndex3 = end;

    tempVar = values[sweepIndex2  + 1];
    values[sweepIndex2 + 1] = values[end];
    values[end] = tempVar;

    timeWait(); //2
    swaps++;

    _sort(values, begin, sweepIndex2);
    _sort(values, sweepIndex2 + 1, end);
  }

  //@Override
  //  public void drawValues() {

  //  float bx;
  //  float bw = (values.length < w) ? w / (values.length) : 1;
  //  float bh;

  //  pushStyle();

  //  colorMode(HSB, values.length);

  //  noStroke();

  //  for (int n = 0; n < values.length; n++) {
  //   fill(color(values[n], 255, 255)); 
  //    if (!sorted) {      
  //      if (n == vIndex1) fill(#FFFFFF);
  //      if (n == vIndex2) fill(#AFAFAF);
  //      if (n == vIndex3) fill(#555555);
  //      //if (sortedIndex > 0 && n < sortedIndex) fill(color(values[n], 255, 255)) else
  //    } else {
  //      fill(color(values[n], 255, 255));
  //    }
  //    bx = map(n, 0, values.length, 0, w);
  //    bh = map(values[n], min, max, 1, h - (paddingTop + paddingBottom));

  //    rect(x + bx + 2, y + (h - bh), bw - 1, bh);
  //  }
  //  popStyle();
  //}
}
