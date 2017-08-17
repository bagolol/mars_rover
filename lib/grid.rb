# the Grid calculates and returns
# the new position when the rover moves on it
class Grid
  OFFSETS = {
    'E' => [1, 0],
    'W' => [-1, 0],
    'N' => [0, 1],
    'S' => [0, -1]
  }.freeze

  attr_reader :bounds
  def initialize(bounds)
    @bounds = bounds
  end

  def calculate_position(face, coord)
    return coord if coord.length < 2
    new_coords = update_coordinates(face, coord)
    are_inside?(new_coords) ? new_coords : invalid_position_err
  end

  private

  def are_inside?(coord)
    result = [coord, bounds].transpose.map do |coords|
      coords[0].between?(0, coords[1])
    end
    result.uniq.length > 1 ? false : result.uniq[0]
  end

  def invalid_position_err
    raise 'this position is not inside the grid'
  end

  def unrecognized_direction
    raise 'this direction is invalid'
  end

  def update_coordinates(face, old_values)
    new_values = OFFSETS[face]
    unrecognized_direction if new_values.nil?
    [old_values, new_values].transpose
                            .map { |x| x.reduce(:+) }
  end
end
