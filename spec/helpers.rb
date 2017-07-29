require 'rover'

module Helpers
  def create_rover(dir)
    grid = double('grid')
    Rover.new(1, 1, dir, grid)
  end
end
