int[] values_n;
int numValues = 256;

SelectionSort sort1;
QuickSort sort2;
InsertionSort sort3;
MergeSort sort4;

void setup() {

  //generateFiles();
  //exit();  

  noSmooth();
  size(800, 600);
  frameRate(120);
  surface.setTitle("Trabalho Pratico 1 - Algoritmos e Estruturas de Dados I");
  
  textFont(loadFont("DejaVuSansMono-20.vlw"));

  int w = width - 20;
  int h = height / 4 - 20;

  values_n = generateSemiSortedDesc(50, 5);

  sort1 = new SelectionSort(values_n, 10, 10, w, h);
  sort2 = new QuickSort(values_n, 10, 20 + h, w, h);
  sort3 = new InsertionSort(values_n, 10, 30 + h * 2, w, h);
  sort4 = new MergeSort(values_n, 10, 40 + h * 3, w, h);
}

void draw() {
  background(0);
  drawAll();
  tickAll();
}

void keyPressed() {

  switch(key) {
  case 'd': 
    setDescending(numValues);
    break;
  case 'k': 
    stopAll();
    break;
  case 'q': 
    setAllRandom(numValues);
    break;
  case 'r': 
    setValuesAll(values_n); 
    break;
  case 's': 
    startAll();
    break;

  case '+': 
    numValues += 10; 
    break;
  case '-': 
    numValues -= 10; 
    break;
  }
}

void setValuesAll(int[] values) {
  sort1.setValues(values);
  sort2.setValues(values);
  sort3.setValues(values);
  sort4.setValues(values);
}

void setAllRandom(int size) {
  int values[] = shuffle(generate(size));
  sort1.setValues(values);
  sort2.setValues(values);
  sort3.setValues(values);
  sort4.setValues(values);
}

void setDescending(int size) {
  sort1.setValues(generateDesc(size));
  sort2.setValues(generateDesc(size));
  sort3.setValues(generateDesc(size));
  sort4.setValues(generateDesc(size));
}

void startAll() {
  sort1.sort();
  sort2.sort();
  sort3.sort();
  sort4.sort();
}

void stopAll() {
  sort1.stop();
  sort2.stop();
  sort3.stop();
  sort4.stop();
}

void drawAll() {
  sort1.draw();
  sort2.draw();
  sort3.draw();
  sort4.draw();
}

void tickAll() {
  sort1.tick();
  sort2.tick();
  sort3.tick();
  sort4.tick();
}
