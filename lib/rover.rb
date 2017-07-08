require 'direction'

class Rover
  include Direction

  attr_reader :x, :y, :direction

  def initialize (x, y, dir, grid)
    @x = x
    @y = y
    @direction = dir
    @grid = grid
  end

  def move
    @x, @y = @grid.calculate_position(@direction, [@x, @y])
  end

  def turn_left
    new_direction = self.send @direction, 'L'
    @direction = new_direction
  end

  def turn_right
    new_direction = self.send @direction, 'R'
    @direction = new_direction
  end

  def return_position
    "#{@x} #{@y} #{direction}"
  end
end
