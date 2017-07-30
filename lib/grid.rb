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
    @occupied_spots = []
  end

  def calculate_position(face, coords)
    return coords if coords.length < 2
    new_coords = update_coordinates(face, coords)
    valid_position?(coords, new_coords) ? new_coords : coords
  end

  private

  def valid_position?(old_coords, new_coords)
    are_inside?(new_coords) && free_square?(old_coords, new_coords)
  end

  def are_inside?(coord)
    result = [coord, bounds].transpose.map do |coords|
      coords[0].between?(0, coords[1])
    end
    result.uniq.length > 1 ? invalid_position_err : result.uniq[0]
  end

  def free_square?(old_coords, new_coords)
    if !@occupied_spots.include?(new_coords)
      store_coords(old_coords, new_coords)
      true
    else
      false
    end
  end

  def store_coords(old, new)
    @occupied_spots << new if @occupied_spots.length == 0
    @occupied_spots
      .map!{ |c| c == new ? c : new }
  end

  def invalid_position_err
    raise 'this position is not inside the grid'
  end

  def unrecognized_direction
    raise 'this direction is invalid'
  end

  def update_coordinates(face, old_values)
    offsets = OFFSETS[face]
    unrecognized_direction if !offsets
    [old_values, offsets].transpose
      .map { |x| x.reduce(:+) }
  end
end
