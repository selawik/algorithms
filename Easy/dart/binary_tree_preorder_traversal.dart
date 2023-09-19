class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// Recursive
List<int> preorderTraversal(TreeNode? root) {
  if (root == null) {
    return [];
  }

  if (root.left == null) {
    return [root.val] + preorderTraversal(root.right);
  }

  if (root.right == null) {
    return [root.val] + preorderTraversal(root.left);
  }

  return [root.val] +
      preorderTraversal(root.left) +
      preorderTraversal(root.right);
}

void main() {
  TreeNode node = TreeNode(1, null, TreeNode(2, TreeNode(3, null, null), null));

  print(preorderTraversal(node));
}
