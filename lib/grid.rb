class Grid

  attr_reader :size
  def initialize size
    @size = size
  end

  def is_within?
    return false
  end
end
