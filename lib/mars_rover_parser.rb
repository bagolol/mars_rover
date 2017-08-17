require_relative 'parser'
# MarsRoverParser reads the input
# and parse it into digestable instrucions
class MarsRoverParser < Parser
  MOVES = { 'L' => 'turn_left', 'R' => 'turn_right', 'M' => 'move' }.freeze

  def parse_grid_size(line)
    line.split.map(&:to_i)
  end

  def parse_position(line)
    *coord, direction = line.split
    [coord.map(&:to_i), direction].flatten
  end

  def parse_commands(line)
    line.strip.split('').map do |command|
      MOVES[command]
    end
  end
end
