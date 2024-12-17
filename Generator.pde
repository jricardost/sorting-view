// embaralha
public int[] shuffle(IntList values) {
  values.shuffle();
  return values.array();
}

public int[] shuffle(int[] values) {
  IntList list = new IntList();
  list.append(values);
  return shuffle(list);
}

//gerador crescentes
public int[] generate(int size) {
  int[] result = new int[size];
  for (int i = 0; i < size; i++) result[i] = i + 1;
  return result;
}

//gerador decrescente
public int[] generateDesc(int size) {
  int[] result = new int[size];
  for (int i = 0; i < size; i++) result[i] = size - i;
  return result;
}

public int[] generateRepeated(int size, int numReps) {
  int i = 0;
  int j = 0;
  int n = 0;
  int[] result = new int[size];

  while (i < size) {
    while (i < size && j < numReps) {
      result[i] = n;
      j++;
      i++;
    }
    n++;
    j = 0;
  }

  return result;
}


/* 1, 2, 3, 4, 5, 6, 7, 8, 9 */
/* 1, 2, 7, 3, 4, 8, 5, 6, 9*/

/* 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 - 4 */
/* 1, 2, 7, 3, 4, 8, 5, 6, 9, 10 */

public int[] generateSemiSortedAsc(int size, int alts) {
  int[] result = new int[size];
  int a, n, d;
  d = size / alts;
  n = 1;
  a = 1;
  
  for (int i = 0; i < size; i++) {
    if ((i + 1) % d != 0) {
      result[i] = a;
      a++;
    } else {
      result[i] = (size - alts) + n;
      n++;
    }
  }
  return result;
}

public int[] generateSemiSortedDesc(int size, int alts) {
  int[] result = new int[size];
  int a, n, d;
  d = size / alts;
  n = 1;
  a = 1;
  
  for (int i = 0; i < size; i++) {
    if ((i + 1) % d != 0) {
      result[size - i - 1] = a;
      a++;
    } else {
      result[size - i - 1] = (size - alts) + n;
      n++;
    }
  }
  return result;
}
