import java.util.*;

TreeRoot root = new TreeRoot();
ArrayList<TreeNode> levels = new ArrayList<TreeNode>();
int rect_wdth = 20;

void setup(){
  size(1000, 500);
  
  //for (int i = 0; i < 10; i++) {
  //  int randomValue = int(random(0, 200));
    
  //}
  
  // Level 1
  root.add(50);
  // Level 2
  root.add(25);
  root.add(75);  
  // Level 3
  root.add(12);
  root.add(37);
  root.add(62);
  root.add(87);
  // Level 4  
  root.add(6);
  root.add(24);
  root.add(31);
  root.add(43);  
  root.add(56);
  root.add(68);
  root.add(81);
  root.add(93);
  
  background(255);
  stroke(180);
  textSize(14);
  levels.add(root.root);
  int level = 1;
  while(levels.size() > 0){
    int nodeNums = levels.size();
    ArrayList<TreeNode> nextLevels = new ArrayList<TreeNode>();
    for (TreeNode curr: levels){
      // Draw (x , y ,w, h)
      fill(255);
      rect(width/2, 25 + level*10, 30, 15);
      fill(0, 102, 153);
      text(curr.value, width/2 + 10, 38 + level*10);
      if (curr.left != null){
        nextLevels.add(curr.left);
      }
      if (curr.right != null){
        nextLevels.add(curr.right);
      }
    }
    
    levels.clear();    
    level++;
  }
  
}

void draw() {
  
  
}
