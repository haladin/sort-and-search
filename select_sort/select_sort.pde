int numberOfNumbers = 200;
int [] valuesSS = new int[numberOfNumbers];
int [] valuesBS = new int[numberOfNumbers];
int deltaX = 1;
int s = 0;
int h = 250;
void setup() {
  size(1000, 500);
  deltaX = width/numberOfNumbers;

  for (int i = 0; i < valuesSS.length; i++) {
    int randomValue = int(random(0, 200));
    valuesSS[i] = randomValue;
    valuesBS[i] = randomValue;
  }
  
colorMode(RGB);
}

void draw() {
  
  background(255);
  stroke(180); 
  for (int i = 0; i < valuesSS.length; i++) {
    if ( i < s){
      fill(120, 120, 120, 255);      
    } else {
      fill(200,200, 200, 100);
    }    
    rect(i*deltaX, h-valuesSS[i], deltaX, valuesSS[i]);
  }
   
  // for (int i = 0; i < Math.min(frameCount, values.length); i++) {
  if (frameCount % 2 == 0 && s < valuesSS.length) {    
    selectSort(s);
    s++;
  }
}

void selectSort(int step){
  int smlIdx = smallest(valuesSS, step);
  if (step != smlIdx){
    swap(valuesSS,step,smlIdx);
  }  
}

void bubbleSort(int step){
    int n = valuesBS.length;
    for (int j = 0; j < n - step - 1; j++){
      if (valuesBS[j] > valuesBS[j + 1])
      {
          // swap temp and arr[i]          
          swap(valuesBS, j, j+1);
      }
    }
        
}

void swap(int[] array, int idxA, int idxB){  
   int a = array[idxA];
   array[idxA] = array[idxB];
   array[idxB] = a;
}

int smallest(int[] array, int startIdx){
  int sml = array[startIdx];
  int smlIdx = startIdx;
  for (int i = startIdx; i <array.length; i++){
    if(sml > array[i]){
      sml = array[i];
      smlIdx = i;
    }
  }
  return smlIdx;
}
