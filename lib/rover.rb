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
    offset = @grid.return_offset @direction
    @x, @y = update_coordinates offset
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

	private

  def calculate_offset
    @grid.return_offset @direction
  end

  def update_coordinates offset
    [[@x,@y], offset].transpose.map {|x| x.reduce(:+)}
  end
end
