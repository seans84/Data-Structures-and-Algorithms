# Ruby problem to solve finding the shortest route on a chess board given 
# both starting and ending coordinates utilizing breadth first search algorithm.
# Extreme amounts of credit to JohnQ, as I was lost before finding his blog.

class Tile
  
  attr_reader :x, :y, :parent, :children
  
  def initialize(x, y, parent = nil)
    @x = x
    @y = y
    @parent = parent
    @children = []
  end
  
  def generate_children
    possible_children = []
    # Generate a list of all possible knight moves
    possible_children << ([@x + 2, @y + 1]) << ([@x + 2, @y - 1]) <<
                         ([@x - 2, @y + 1]) << ([@x - 2, @y - 1]) <<
                         ([@x + 1, @y + 2]) << ([@x + 1, @y - 2]) <<
                         ([@x - 1, @y + 2]) << ([@x - 1, @y - 2])
    # Select only those moves that would fall on the board as potential children
    children = possible_children.select{ |child| child[0] >= 0 &&
                 child[0] <= 7 && child[1] >= 0 && child[1] <= 7} 
    # This makes object with possible move coordinates, along with establishing
    # a parent so we can trace our steps back in the future to find the route.
    children = children.map{|child_coordinates| 
                 Tile.new(child_coordinates[0], child_coordinates[1], self)}
    @children = children
  end
end

# Breadth first search as depth first searching could yield an endless loop
def find_ending_tile(endpoint, startpoint)
  queue = []
  queue << startpoint
  loop do 
    current = queue.shift
    # When you reach the point where x,y coordinates of the curent location
    # match the x,y coordinates of the ending point you have arrived.
    return current if current.x == endpoint.x && current.y == endpoint.y
    # Plot new moves, i.e. children in search of the endpoint.
    current.generate_children.each {|child| queue << child}
  end
end

def find_route(root_arr, search_arr)
  # Set the final tiles position with x,y coordinates to "endpoint"
  endpoint   = Tile.new(search_arr[0], search_arr[1])
  # Set the starting tiles position with x,y coordinates to "startpoint"
  startpoint = Tile.new(root_arr[0], root_arr[1])
  # Run the "find_ending_tile" method in order to find the route to the 
  # endpoint via children generation.
  result = find_ending_tile(endpoint, startpoint)
  
  route = []
  # Place the final tiles position with x,y coordinates into route[0] and [1]
  # respectively.
  route.unshift([endpoint.x, endpoint.y])
  # Create a variable called "current" that is effectively the parent node
  current = result.parent
  # Loop through until the parent node, i.e. "current" is nil which means 
  # it has reached the termination of the route.
  until current.nil?
    # Add the path to the route array at the front via .unshift method
    route.unshift [current.x, current.y]
    # Reset the current variable so that it is again the parent
    current = current.parent
  end
  puts "You made it in #{route.length - 1} moves.  Here is your path: "
  route.each {|tile| puts tile.inspect}
  return nil
end
    
find_route([0, 0], [7, 7])
find_route([2, 3], [6, 2])