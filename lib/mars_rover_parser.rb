require_relative 'parser'

class MarsRoverParser < Parser
  MOVES = Hash['L','turn_left','R','turn_right', 'M', 'move']

  def parse_grid_size line
    line.split().map(&:to_i)
  end

  def parse_position line
    *coord, direction = line.split
    [coord.map(&:to_i), direction].flatten
  end

  def parse_commands line
    match_commands = ->(c) { MOVES[c] }
    line.strip.split('').map &match_commands
  end
end

