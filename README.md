# Mars Rovers

This is the solution to the Mars rovers exercise.

I used RSpec (v. 3.6) to unit test my code and ruby (v. 2.2.5) to run it.

To run the code clone this repo and run:
```
ruby start.rb
```

This will read the input file with the following instructions:
```
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
```
I assumed that a rover can't go out of the grid/plateau borders. In case it does, an error will be thrown. Currently, rovers can share the same position or move through an occupied one.
