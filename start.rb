#!/usr/bin/env ruby
require './lib/mars_rover_parser'
require './lib/grid'
require './lib/rover'

parser = MarsRoverParser.new('commands.txt')
lines = parser.read_file
grid_size = parser.parse_grid_size lines[0]
x1, y1, direction1 = parser.parse_position lines[1]
x2, y2, direction2 = parser.parse_position lines[3]
rover1_commands = parser.parse_commands lines[2]
rover2_commands = parser.parse_commands lines[4]
grid = Grid.new(grid_size)
rover1 = Rover.new(x1, y1, direction1, grid)
rover2 = Rover.new(x2, y2, direction2, grid)
rover1_commands.each { |c| rover1.send c }
rover2_commands.each { |c| rover2.send c }
puts rover1.return_position
puts rover2.return_position

