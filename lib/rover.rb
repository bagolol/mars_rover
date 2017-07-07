class Rover
  attr_reader :x, :y, :dir

  def initialize (x, y, dir)
    @x = x
    @y = y
    @dir = dir
  end

  def move
    true
  end

  def turn_left
    true
  end

  def turn_right
    true
  end
end
