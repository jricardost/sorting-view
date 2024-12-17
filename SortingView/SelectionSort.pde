public class SelectionSort extends BaseView {


  public SelectionSort(int x, int y, int w, int h) {
    super(x, y, w, h);
  }

  public SelectionSort(int[] values, int x, int y, int w, int h) {
    super(values, x, y, w, h);
  }

  /* --- ALIASES --- */

  public void normalSort() {
    comparisons = 0;
    swaps = 0;
    sorted = false;
    _sort(values, 0);
  }


  /* --- IMPLEMENTAÇÃO --- */

  //Executa cada passo em 1 frame da visualização
  private void _sort(int[] values, int startIndex) {
    if (startIndex == values.length - 1) return;

    int auxIndex = startIndex;
    int sweepIndex = 0;
    int tempVar;

    for (sweepIndex = startIndex + 1; sweepIndex <= values.length - 1; sweepIndex++) {

      vIndex1 = startIndex;
      vIndex2 = sweepIndex;   
      
      if (values[sweepIndex] <= values[auxIndex]) {
        auxIndex = sweepIndex;      
      }
      
      vIndex3 = auxIndex;
      comparisons++;
      timeWait(); // 1
    }

    if (values[startIndex] > values[auxIndex]) {
      tempVar = values[auxIndex];
      values[auxIndex] = values[startIndex];
      values[startIndex] = tempVar;

      vIndex1 = auxIndex;
      vIndex3 = startIndex;
      swaps++;
      
    }
    timeWait(); //2
    sortedIndex++;
    _sort(values, startIndex + 1);
  }
}
