class Card {
 
  int min, max, size;
  boolean free;
  int[] numbers;
  
  Card (int _size, int _min, int _max, boolean freepark) {
    free = freepark;
    min = _min;
    max = _max;
    size = _size;
    numbers = new int[size*size];
    generateNumbers();
    plot();
  }
  
  
  void generateNumbers(){
    int newNumber = 0;
    int i = 0;
    
    while (i < numbers.length) {
      newNumber = (int)random(min, max);
      if(!numIsInArray(newNumber, numbers)){
        numbers[i] = newNumber;
        i++;
      }
    }
  }
  
  boolean numIsInArray(int num, int[] array){
   
    for (int i = 0; i < array.length; i = i+1) {
      if(array[i] == num){
        return true;
      }
    }
    
    return false;
    
  }
  
  void plot(){
  for(int i = 0; i < numbers.length; i++){
   print(numbers[i]+", "); 
  }
  println();
  }
  
}
