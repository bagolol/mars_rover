module Direction
  def self.calc_new(dir, to_side)
    case dir
    when 'N'
      from_north to_side
    when 'E'
      from_east to_side
    when 'S'
      from_south to_side
    when 'W'
      from_west to_side
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
end
