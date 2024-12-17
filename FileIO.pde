void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
  }
}

void folderSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
  }
}

void generateFiles(){
  
    //random
    writeToFile("input-100-ran.txt", shuffle(generate(100)));
    writeToFile("input-1k-ran.txt", shuffle(generate(1000)));
    writeToFile("input-100k-ran.txt", shuffle(generate(100000)));
    writeToFile("input-500k-ran.txt", shuffle(generate(500000)));
    
    //ascending
    writeToFile("input-100-asc.txt", (generate(100)));
    writeToFile("input-1k-asc.txt", (generate(1000)));
    writeToFile("input-100k-asc.txt", (generate(100000)));
    writeToFile("input-500k-asc.txt", (generate(500000)));
    
    //descending
    writeToFile("input-100-des.txt", (generateDesc(100)));
    writeToFile("input-1k-des.txt", (generateDesc(1000)));
    writeToFile("input-100k-des.txt", (generateDesc(100000)));
    writeToFile("input-500k-des.txt", (generateDesc(500000)));
    
    //Repeated 10%
    writeToFile("input-100-rasc.txt", (generateRepeated(100, 10)));
    writeToFile("input-1k-rasc.txt", (generateRepeated(1000, 100)));
    writeToFile("input-100k-rasc.txt", (generateRepeated(100000, 10000)));
    writeToFile("input-500k-rasc.txt", (generateRepeated(500000, 50000)));
    
    //Repeated Desc
    writeToFile("input-100-rdes.txt", (generateRepeated(100, 10)));
    writeToFile("input-1k-rdes.txt", (generateRepeated(1000, 100)));
    writeToFile("input-100k-rdes.txt", (generateRepeated(100000, 10000)));
    writeToFile("input-500k-rdes.txt", (generateRepeated(500000, 50000)));
    
    //Semi Asc
    writeToFile("input-100-ssdes.txt", (generateRepeated(100, 10)));
    writeToFile("input-1k-ssdes.txt", (generateRepeated(1000, 100)));
    writeToFile("input-100k-ssdes.txt", (generateRepeated(100000, 10000)));
    writeToFile("input-500k-ssdes.txt", (generateRepeated(500000, 50000)));
    
}

void writeToFile(String filename, int[] array){
  int i;
  PrintWriter file = createWriter(filename);
  file.println(array.length);
  for (i = 0; i < array.length - 1; i++){
    file.print(array[i] + " ");
  }
  file.print(array[i]);
  file.flush();
  file.close();
}
