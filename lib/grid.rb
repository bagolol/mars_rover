class Grid

  attr_reader :size
  def initialize size
    @size = size
  end

  def is_within?
    return false
  end

  def return_offset cardinal
    case cardinal
    when 'E'
      [1,0]
    when 'W'
      [-1, 0]
    when 'N'
      [0, 1]
    when 'S'
      [0,-1]
    end
  end
end
