require_relative 'direction'

class Rover

  attr_reader :x, :y, :direction

  def initialize(x, y, dir, grid)
    @x = x
    @y = y
    @direction = dir
    @grid = grid
  end

  def process_commands(commands)
    return_position if commands.empty?
    commands.each do |command|
      case command
      when 'move'
        move
      when 'turn_left'
        turn_left
      when 'turn_right'
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
    @direction = Direction.calc_new(direction, 'L')
  end

  def turn_right
    @direction = Direction.calc_new(direction, 'R')
  end

  def return_position
    "#{x} #{y} #{direction}"
  end

  def unrecognized_command
    error_message = 'this is not a valid command'
    raise StandardError, error_message
  end
end
