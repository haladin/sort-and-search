import java.util.*;

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
