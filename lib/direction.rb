# this module contains methods to
# update the direction expressed
# in cardinal points
module Direction
  def self.calc_new(dir, side)
    invalid_side_error if invalid_side?(side)
    case dir
    when 'N'
      from_north(side)
    when 'E'
      from_east(side)
    when 'S'
      from_south(side)
    when 'W'
      from_west(side)
    else
      raise 'not a valid direction'
    end
  end

  def self.from_north(dir)
    dir == 'R' ? 'E' : 'W'
  end

  def self.from_east(dir)
    dir == 'R' ? 'S' : 'N'
  end

  def self.from_south(dir)
    dir == 'R' ? 'W' : 'E'
  end

  def self.from_west(dir)
    dir == 'R' ? 'N' : 'S'
  end

  def self.invalid_side?(side)
    side != 'R' && side != 'L'
  end

  def self.invalid_side_error
    raise 'not a valid side'
  end
end
