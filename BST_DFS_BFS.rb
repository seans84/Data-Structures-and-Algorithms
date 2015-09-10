# Kota to learn Binary Tree DFS and BFS.
# Which makes very little sense given it is a binary tree
# and not a graph.  But per Odin Projects instructions it 
# was made.
# credit to thomasjnoe

class Node
  attr_accessor :value, :parent, :left, :right
  
  def initialize(value, parent, left, right)
    @value = value
    @parent = parent
    @left = left
    @right = right
  end
end

class BST
  attr_accessor :arr, :root
  def initialize(arr)
    @arr = arr
    @root = Node.new(arr[0], nil, nil, nil)
  end
  
  def build_tree
    arr.each do |node|
      add(node)
    end
  end
  
  def add(value, current_node = root)
    unless value == current_node.value
      if value < current_node.value
        current_node.left.nil? ? current_node.left = 
        Node.new(value, current_node, nil, nil) : add(value, current_node.left)
      else
        current_node.right.nil? ? current_node.right = 
        Node.new(value, current_node, nil, nil) : add(value, current_node.right)
      end
    end
  end
  
  def breadth_first_search(value)
    # Set a new queue, initialized with root
    queue = [root]
    # Loop through until the queue is empty which indicates the search has
    # finished.
    until queue.empty?
      # This takes the first element of the queue array and removes it with 
      # .shift and sets current_node variable equal to that.
      current_node = queue.shift 
      # This returns the current nodes value if it has reached the end of the 
      # traverse and there are no more children to search
      return current_node.value if value == current_node.value
      # This adds onto the end of the queue array the left child element 
      # unless there is no left child.
      queue.push(current_node.left) unless current_node.left.nil?
      # This is simliar to the last line except with the right child
      queue.push(current_node.right) unless current_node.right.nil?
    end
    nil
  end
  
  def depth_first_search(value)
    # Initialize a new stack with root
    stack = [root]
    # Loop through all the stack until it is empty, indicating the search is
    # complete.
    until stack.empty?
      # Set the current node equal to the last element of the stack, and remove
      # that element from the stack
      current_node = stack.pop
      # Return the value of the current node if it equals the parameter past in
      # which indicates it has reached the end of the traverse
      return current_node.value if value == current_node.value
      stack.push(current_node.left) unless current_node.left.nil?
      stack.push(current_node.right) unless current_node.right.nil?
    end
    nil
  end
  
  def dfs_rec(value, current_node = root)
    return current_node.value if value == current_node.value
    unless current_node.left.nil?
      result = dfs_rec(value, current_node.left)
      return result unless result.nil?
    end
    unless current_node.right.nil?
      result = dfs_rec(value, current_node.right)
      return result unless result.nil?
    end
    nil
  end
  
  def bfs_show_tree
    queue = [root]
    until queue.empty?
      current_node = queue.shift
      puts "Current Node is #{current_node.value}"
      left_child = current_node.left.nil? ? "None" : current_node.left.value
      right_child = current_node.right.nil? ? "None" : current_node.right.value
      puts "Current Node's children: #{left_child}, #{right_child}"
      queue.push(current_node.left) if current_node.left.nil? == false
      queue.push(current_node.right) if current_node.right.nil? == false
    end
  end
end


arr = [0,2,4,5,10,14,18,20]
arr.shuffle!
new_tree = BST.new(arr)
new_tree.build_tree
puts new_tree.breadth_first_search(10)
puts new_tree.depth_first_search(10)
puts new_tree.dfs_rec(10)
  
  

