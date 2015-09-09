class TreeNode
  attr_accessor :value, :left, :right
  
  def initialize val, left, right
    @value = val
    @left = left
    @right = right
  end
end

class BinarySearchTree
  
  # Initiliaze the root node
  def initialize val
    puts "Initializing with: #{val.to_s}" 
    @root = TreeNode.new(val, nil, nil)
  end
  
  # Pre-Order traversal
  def pre_order_traversal(node = @root)
    return if (node == nil)
    pre_order_traversal(node.left)
    pre_order_traversal(node.right)
    puts node.value.to_s
  end
  
  # Post-Order traversal
  def post_order_traversal(node = @root)
    return if (node == nil)
    puts node.value.to_s
    post_order_traversal(node.left)
    post_order_traversal(node.right)
  end
  
  # In-Order traversal
  def in_order_traversal(node = @root)
    return if (node == nil)
    in_order_traversal(node.left)
    puts node.value.to_s
    in_order_traversal(node.right)
  end
  
  # Insert a value
  # If you hit a nil value it means that a new node should be created
  # in that spot.
  def insert(value)
    puts "Inserting: #{value.to_s}"
    current_node = @root
    while nil != current_node
      if (value < current_node.value) && (current_node.left == nil)
        current_node.left = TreeNode.new(value, nil, nil)
      elsif (value > current_node.value) && (current_node.right == nil)
        current_node.right = TreeNode.new(value, nil, nil)
      elsif (value < current_node.value)
        current_node = current_node.left
      elsif (value > current_node.value)
        current_node = current_node.right
      else
        return
      end
    end
  end
end

bst = BinarySearchTree.new(10)
bst.insert(11)
bst.insert(9)
bst.insert(5)
bst.insert(7)
bst.insert(18)
bst.insert(17)
# Demonstrating Different Kinds of Traversals
puts "In-Order Traversal:"
bst.in_order_traversal
puts "Pre-Order Traversal:"
bst.pre_order_traversal
puts "Post-Order Traversal:"
bst.post_order_traversal
