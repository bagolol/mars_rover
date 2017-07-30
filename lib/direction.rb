# this module contains methods to
# update the direction expressed
# in cardinal points
module Direction
  CARDINAL_POINTS = {
    'N' => ['E', 'W'],
    'E' => ['S', 'N'],
    'S' => ['W', 'E'],
    'W' => ['N', 'S']
  }

  def self.calc_new(cardinal, dir)
    invalid_cardinal_error if !CARDINAL_POINTS[cardinal]
    invalid_dir_error if (dir != 'R' && dir != 'L')
    update_cardinals(dir, cardinal)
  end

  def self.update_cardinals(dir, cardinal)
    cardinals = CARDINAL_POINTS[cardinal]
    dir == 'R' ? cardinals[0] : cardinals[1]
  end

  def self.invalid_dir_error
    raise 'not a valid direction'
  end

  def self.invalid_cardinal_error
    raise 'not a valid cardinal point'
  end
end
