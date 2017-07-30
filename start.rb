#!/usr/bin/env ruby
require './lib/mars_rover_parser'
require './lib/grid'
require './lib/rover'

parser = MarsRoverParser.new('input.txt')
lines = parser.read_file
grid_size = parser.parse_grid_size lines[0]
x1, y1, direction1 = parser.parse_position lines[1]
x2, y2, direction2 = parser.parse_position lines[3]
rover1_commands = parser.parse_commands lines[2]
rover2_commands = parser.parse_commands lines[4]
grid = Grid.new(grid_size)
rover1 = Rover.new({:x => x1, :y => y1, :dir => direction1, :grid => grid})
rover2 = Rover.new({:x => x2, :y => y2, :dir => direction2, :grid => grid})
puts rover1.process_commands(rover1_commands)
puts rover2.process_commands(rover2_commands)
