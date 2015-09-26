# Data-Structures-and-Algorithms
Binary tree search and depth first / breadth first searching, with a 
small sample project titled "Knights-Travails".

# Knights-Travails
Given enough moves, a knight can move to any square on a chess board.
This project allows a person to find the shortest path between two 
squares that a knight can take using a breadth first searching algorithm.

###Modifying Starting and Ending Squares
Open KnightsTravails.rb and on line 76 and 77 you will find the beginning 
and ending squares in two arrays based on x,y coordinates.  Modify these
to whatever amounts you desire, while not picking a value that does not 
lie on the board, i.e. within the range value of 0,0 to 7,7.  

###Run
In the command line run "ruby KnightsTravails.rb" and the shortest route
to your desired ending square will be output in x,y coordinates along with
the require amount of steps necessary.

```
You made it in 6 moves.  Here is your path: 
[0, 0]
[2, 1]
[4, 2]
[6, 3]
[4, 4]
[6, 5]
[7, 7]
```
