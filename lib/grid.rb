class Grid

  attr_reader :bounds
  def initialize bounds
    @bounds = bounds
  end

  def are_inside? coord
    check_bounds = ->(el){ el[0].between?(0, el[1]) }
    result = [coord, bounds].transpose.map &check_bounds
    result.uniq.length > 1 ? false : result.uniq[0]
  end

  def calculate_position face, coord
    new_coords = nil
    case face
    when 'E'
      new_coords = update_coordinates(coord, [1,0])
    when 'W'
      new_coords = update_coordinates(coord, [-1,0])
    when 'N'
      new_coords = update_coordinates(coord, [0,1])
    when 'S'
      new_coords = update_coordinates(coord, [0,-1])
    end
    are_inside?(new_coords) ? new_coords : raise_error
  end

  private

  def raise_error
    error_message = 'this position is not inside the grid'
    raise StandardError, error_message
  end

  def update_coordinates old, new
    [old, new].transpose.map {|x| x.reduce(:+)}
  end
end
