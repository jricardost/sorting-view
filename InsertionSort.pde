public class InsertionSort extends BaseView {

  public InsertionSort(int x, int y, int w, int h) {
    super(x, y, w, h);
  }

  public InsertionSort(int[] values, int x, int y, int w, int h) {
    super(values, x, y, w, h);
    //history = new History();
  }

  /* --- ALIASES --- */

  public void normalSort() {
    comparisons = 0;
    swaps = 0;
    sorted = false;
    _sort(values, values.length - 1);
  }


  /* --- IMPLEMENTAÇÃO --- */

  //Executa cada passo em 1 frame da visualização
  public void _sort(int[] values, int startIndex) {

    if (startIndex == 0) return;

    int sweepIndex = 0;
    int tempVar;

    _sort(values, startIndex  - 1);

    for (sweepIndex = startIndex; sweepIndex > 0; sweepIndex--) {
      vIndex1 = sweepIndex;
      vIndex2 = startIndex;
      
      comparisons++;
      if (values[sweepIndex] < values[sweepIndex-1]) {
        tempVar = values[sweepIndex];
        values[sweepIndex] = values[sweepIndex-1];
        values[sweepIndex-1] = tempVar;
        
        vIndex1--;
        swaps++;
      } else {
        timeWait();
        return;
      }

      timeWait();
    }
  }
}
