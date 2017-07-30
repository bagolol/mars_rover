require_relative 'direction'

class Rover

  attr_reader :direction

  def initialize(args)
    @x = args[:x]
    @y = args[:y]
    @direction = args[:dir]
    @grid = args[:grid]
  end

  def process_commands(commands)
    return_position if commands.empty?
    commands.each do |command|
      case command
      when 'move'
        @x, @y = move
      when 'turn_left'
        @direction = turn_left
      when 'turn_right'
        @direction = turn_right
      else
        unrecognized_command
      end
    end
    return_position
  end

  private

  def move
    @grid.calculate_position(direction, [@x, @y])
  end

  def turn_left
    Direction.calc_new(direction, 'L')
  end

  def turn_right
    Direction.calc_new(direction, 'R')
  end

  def return_position
    "#{@x} #{@y} #{direction}"
  end

  def unrecognized_command
    error_message = 'this is not a valid command'
    raise StandardError, error_message
  end
end
