require 'rover'

module Helpers
  def create_rover(dir)
    grid = double('grid')
    Rover.new(
      x: 1,
      y: 1,
      dir: dir,
      grid: grid
    )
  end
end
