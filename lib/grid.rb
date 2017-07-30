class Grid
  attr_reader :bounds
  def initialize(bounds)
    @bounds = bounds
  end

  def are_inside?(coord)
    result = [coord, bounds].transpose.map do |coords|
      is_between?(coords)
    end
    result.uniq.length > 1 ? false : result.uniq[0]
  end

  def calculate_position(face, coord)
    return coord if coord.length < 2
    new_coords = nil
    case face
    when 'E'
      new_coords = update_coordinates(coord, [1, 0])
    when 'W'
      new_coords = update_coordinates(coord, [-1, 0])
    when 'N'
      new_coords = update_coordinates(coord, [0, 1])
    when 'S'
      new_coords = update_coordinates(coord, [0, -1])
    else
      unrecognized_direction
    end
    are_inside?(new_coords) ? new_coords : raise_error
  end

  private

  def raise_error
    error_message = 'this position is not inside the grid'
    raise StandardError, error_message
  end

  def is_between? coords
    coords[0].between?(0, coords[1])
  end

  def unrecognized_direction
    error_message = 'this direction is invalid'
    raise StandardError, error_message
  end

  def update_coordinates(old, new)
    [old, new].transpose.map { |x| x.reduce(:+) }
  end
end
