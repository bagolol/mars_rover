require 'direction'

class Rover
  include Direction
  attr_reader :x, :y, :dir, :grid
  @@points = Hash['N', 'north','S','south','W', 'west','E', 'east']
  def initialize (x, y, dir, grid)
    @x = x
    @y = y
    @dir = dir
    @grid = grid
  end
  
  def move
    offset = grid.return_offset @dir 
    add_offset offset
  end

  def turn_left 
    direction = @@points[@dir]
    @dir = self.send direction, 'L'
  end

  def turn_right
    direction = @@points[@dir]
    @dir = self.send direction, 'R'
  end

  private

  def calculate_offset 
    grid.return_offset @dir
  end

  def add_offset offset
    [[@x,@y], offset].transpose.map {|x| x.reduce(:+)}
  end
end
