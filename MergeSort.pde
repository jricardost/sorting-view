public class MergeSort extends BaseView {

  int vIndex4 = -1;
  int vIndex5 = -1;

  public MergeSort(int x, int y, int w, int h) {
    super(x, y, w, h);
  }

  public MergeSort(int[] values, int x, int y, int w, int h) {
    super(values, x, y, w, h);
    //history = new History();
  }

  /* --- ALIASES --- */

  public void normalSort() {
    comparisons = 0;
    swaps = 0;
    sorted = false;
    _sort(values);
  }


  /* --- IMPLEMENTAÇÃO --- */

  //Executa cada passo em 1 frame da visualização
  public void _sort(int values[])
  {
    mergeSort(values, 0, values.length - 1);
  }

  void mergeSort(int values[], int begin, int end)
  {
    vIndex4 = begin;
    vIndex5 = end;

    if (begin < end) {

      int half = begin + (end - begin) / 2;

      vIndex3 = half;

      mergeSort(values, begin, half);
      mergeSort(values, half + 1, end);

      vIndex3 = half;
      vIndex4 = begin;
      vIndex5 = end;

      //merge
      int sweepIndex1 = half + 1;


      if (values[half] > values[sweepIndex1]) {

        while (begin <= half && sweepIndex1 <= end) {

          comparisons++;
          if (values[begin] <= values[sweepIndex1]) {
            begin++;
            
          } else {

            //int value = values[sweepIndex1];
            //int sweepIndex2 = sweepIndex1;

            //while (sweepIndex2 != begin) {
            //  values[sweepIndex2] = values[sweepIndex2 - 1];
            //  sweepIndex2--;

            //  vIndex2 = sweepIndex2;
            //  swaps++;
            //}
            
            //timeWait();
            //values[begin] = value;
            
            int value;
            int sweepIndex2 = sweepIndex1;
            
            vIndex1 = sweepIndex2;
            
            while(sweepIndex2 > begin){
               value = values[sweepIndex2];
               values[sweepIndex2] = values[sweepIndex2 - 1];
               values[sweepIndex2 - 1] = value;
               sweepIndex2--;
               
               vIndex2 = sweepIndex2;
               swaps++;
               timeWait(); //1
            }           
            
            begin++;
            half++;
            sweepIndex1++;
            
            swaps++;
          }
          timeWait(); //2
        }
      }
    }
  }

  @Override
    public void setValues(int[] values) {
    super.setValues(values);
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

      fill(color(values[n], 255, 255)); 
      drawBar(x + bx, y + (h - bh) - 10, bw, bh);

      if (!sorted) {      
        if (n == vIndex1) {
          fill(#FFFFFF); 
          rect(x + bx + 2, y + h - 10, bw - 1, 10);
        }
        if (n == vIndex2) {
          fill(#AFAFAF); 
          rect(x + bx + 2, y + h - 10, bw - 1, 10);
        }
        //if (n == vIndex3) {
        //  fill(#FFE900); 
        //  rect(x + bx + 2, y + h - 10, bw - 1, 10);
        //}
        if (n == vIndex4) {
          fill(#00FF00); 
          rect(x + bx + 2, y + h - 10, bw - 1, 10);
        }
        if (n == vIndex5) {
          fill(#FF0000); 
          rect(x + bx + 2, y + h - 10, bw - 1, 10);
        }
        //if (sortedIndex > 0 && n < sortedIndex) fill(color(values[n], 255, 255)) else
      }
    }
    popStyle();
  }
}
