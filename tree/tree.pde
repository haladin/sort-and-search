import java.util.*;

TreeRoot root = new TreeRoot();

int rect_wdth = 20;
int center = 1200;
boolean redraw = true;
String input="";

void setup(){
  size(1200, 1000);
  initTree();   
}

void initTree() {
 root = new TreeRoot();
 for (int i = 0; i < 15; i++) {
    int randomValue = int(random(0, 50));
    root.add(randomValue);
  } 
  
}

void mouseClicked() {
  //  rect(15, 50, 70, 25);
  if (mouseX >= 15 && mouseX <=85 && mouseY>= 50 && mouseY <= 75  ){
    initTree();
    redraw = true;
  }
  // rect(15, 85, 70, 25);
  if (mouseX >= 15 && mouseX <=85 && mouseY>= 85 && mouseY <= 110  ){
    root = new TreeRoot();
    redraw = true;
  }
}

void keyPressed() {
  if (key==BACKSPACE) {
      if (input.length() > 0) {
        input=input.substring(0, input.length()-1);
      } 
    }
    else if (key==RETURN || key==ENTER) {
      root.add(Integer.valueOf(input));
      redraw = true;
      input="";
    }
    else {
      if (key>= '0' && key <='9'){
        input+=key;
      }
    }
    println (input);
}

void draw() {
  if (redraw) {    
    ArrayList<TreeNode> levels = new ArrayList<TreeNode>();    
    background(255);
    stroke(180);
    textSize(14);    
    levels.add(root.root);
    int level = 1;
    int row = 1;
    boolean stop = false;
    while(!stop){      
      ArrayList<TreeNode> nextLevels = new ArrayList<TreeNode>();
      int startW = center/(level*2);    
      int count = 1;
      for (TreeNode curr: levels){
        if (curr != null) {
          // Draw (x , y ,w, h)
          fill(255);
          rect(startW, 25 + row*75, 30, 15);        
          int leftX = 0;
          int rightX = 0;
          if (count == 1){
            leftX = (center)/(level*4);
            rightX = (3*center)/(level*4);;
          } else {
            leftX = ((2*count-1)*center)/(level*4);
            rightX = ((2*count+1)*center)/(level*4);
          }
          if (curr.left != null){
            line(startW + 15, 25 + row*75+15,leftX +15 ,25 + (row+1)*75);
          }
          if (curr.right != null){
            line(startW + 15, 25 + row*75+15,rightX +15 ,25 + (row+1)*75);
          }
          fill(0, 102, 153);
          text(curr.value,startW + 10, 38 + row*75);
          nextLevels.add(curr.left);
          nextLevels.add(curr.right);
        } else {
          nextLevels.add(null);
          nextLevels.add(null);
        }
        count += 2;
        startW = (count*center)/(level*2);
      }    
      levels = nextLevels;
      level *=2;
      row++;
      stop = true;
      for (TreeNode curr: levels){
        if (curr != null){
          stop = false;
        }
      }
    }
    
    redraw = false;
  }
  
  // Add node
  fill(40);    
  text("Add node: ", 15, 30);
  
  fill(255);
  rect(80, 15, 70, 20);
  fill(40);    
  text(input, 85, 30);
  // New tree button
  fill(200);
  rect(12, 47, 76, 31);
  fill(255);
  rect(15, 50, 70, 25);
  fill(40);    
  text("New tree", 20, 67);
  
  // New empty button
  fill(200);
  rect(12, 82, 76, 31);
  fill(255);
  rect(15, 85, 70, 25);
  fill(40);    
  text("Empty tree", 20, 102);
}

public class TreeNode
{
  public int value = 0;
  public TreeNode left;
  public TreeNode right;
  
  public TreeNode(){
  }
  
  public TreeNode(int value){
   this.value = value; 
   this.left = null;
   this.right = null;
  }
  
}



public class TreeRoot
{
  
  public TreeNode root;
  
  public TreeRoot(){
  }
  
  public void add(int value) {
      root = addRecursive(root, value);
  }
    
  private TreeNode addRecursive(TreeNode current, int value) {
    if (current == null) {
        return new TreeNode(value);
    }

    if (value < current.value) {
        current.left = addRecursive(current.left, value);
    } else if (value > current.value) {
        current.right = addRecursive(current.right, value);
    } else {
        // value already exists
        return current;
    }

    return current;
  }
 
  
}
