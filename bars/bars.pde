
int[] array; 
int num = 200;
int start = 0;
int width = 1024;
void setup() {
  size(1024, 640);
  array = new int[num];
  for (int i = 0; i < num; i++) {
    array[i] = (int)random(num);
  }
  noLoop();
}

void draw() {
  for (int i = 0; i < num; i++) {
    fill(array[i]);
    rect(start + i* width/(array.length), 500 - array[i], width/(array.length), array[i]);    
  }  
}
