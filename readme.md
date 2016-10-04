Minefield - Test Exersice
========

## Exercise Description

There is a field of mines. Each mine is identified by a 2d-coordinate and a blast radius. When a mine explodes at time interval t, it explodes mines that lay within its blast radius at t + 1.

Given a list of mines consisting of their X & Y coordinates and radius (ex 2, 2, 5), write a program that finds which mine in the list triggers the most explosions in the fewest number of time intervals.

## Conditions

* Assume that minefield has a chain reaction. An interval between current and next blasts is one step of this reaction.
* Assume that duration of chain reaction is count of reaction steps.
* We don't use the first mine in our calculations.

## Input data

* Input file should contain lines with 3 numbers (x, y, radius) separated by space (or spaces)
* Assume that we can set coordinates as integer or float

## Output data

Result is a table with details about each mine and its reaction. We can see explosions count, duration and details about each time interval. We sort all mines by rank calculating by formula:

`explosions / duration`

Assume that the mine in the top of the list triggers the most explosions in the fewest duration. If few mines have the same rank we sort them by number of explosions.
If output file already exists, it will be overwritten.

## Dependencies

* Ruby 2.1.2 or above
* RSpec 3.1.7 or above

## Launch

`ruby main.rb`

This is the short way to run script. Program will read data from `input.txt` by default and write result to `output.txt`.
If you want to set up filenames for input and output files you can call:

`ruby main.rb input_filname.txt output_filename.txt`

Also you can look at the usage info:

`ruby main.rb --help`

## Test

`rspec`

Just run rspec in the root of project.
