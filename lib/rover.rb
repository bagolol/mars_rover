require_relative 'direction'

class Rover
  include Direction

  attr_reader :x, :y, :direction

  def initialize(x, y, dir, grid)
    @x = x
    @y = y
    @direction = dir
    @grid = grid
  end

  def process_commands commands
    return_position if commands.empty?
    commands.each do |command|
      case command
      when 'M'
        move
      when 'L'
        turn_left
      when 'R'
        turn_right
      else
       unrecognized_command
      end
    end
      return_position
  end

  def move
    @x, @y = @grid.calculate_position(direction, [x, y])
  end

  def turn_left
    new_direction = send direction, 'L'
    @direction = new_direction
  end

  def turn_right
    new_direction = send direction, 'R'
    @direction = new_direction
  end

  def return_position
    "#{x} #{y} #{direction}"
  end

  def unrecognized_command
    error_message = 'this is not a valid command'
    raise StandardError, error_message
  end
end
