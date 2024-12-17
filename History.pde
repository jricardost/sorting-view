/* Lista Duplamente Encadeada */
/* - Salva todas as comparações e trocas executadas no algoritmo */

public class History {

  final int EVENT_COMPARE = 0;  // Comparações entre valores
  final int EVENT_SWAP = 1;     // Trocas de Posição 

  Event firstEvent;
  Event lastEvent;
  Event currentEvent;

  int numOfComparisons = 0;
  int numOfSwaps = 0;  
  int numOfEvents = 0;
  int curentEventIndex = -1;


  class Event {

    int type; //0 = Comparação / 1 = Troca / N - Qualquer outro utilizado pelo algoritmo...
    int[] indexes;

    Event previous;
    Event next;

    public Event(int type, int ... values) {
      this.type = type;
      this.indexes = values.clone();
    }

    public void debug() {
      print("Type: ");
      switch(type){
         case EVENT_COMPARE : print("C ("); break;
         case EVENT_SWAP : print("S ("); break;
         default : print("O ("); break;
      }
      for (int i = 0; i < indexes.length; i++) {
        print(i + ((i == indexes.length - 1) ? "" : ", "));
      }
      println(")");
    }
  }


  public History() {
  }

  public void add(int type, int ... indexes) {
    currentEvent = new Event(type, indexes);

    if (numOfEvents == 0) {
      firstEvent = currentEvent;
      lastEvent = currentEvent;
    } else {
      lastEvent.next = currentEvent;
      currentEvent.previous = lastEvent;
      lastEvent = currentEvent;
    }

    numOfEvents++;
  }

  public void debug() {
    Event e = firstEvent;
    
    if (e != null) {
      do {
        e.debug();
        e = e.next;
      } while(e != null);
    }
  }
}
