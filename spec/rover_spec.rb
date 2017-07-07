require "spec_helper"
require "rover"
require "grid"

describe Rover do
  before(:each) do
    grid = Grid.new([5,5])
    @rover = Rover.new(1, 1, 'N', grid)
  end
  context 'when created' do
    it 'has an initial position' do
      expect(@rover.x).to eq 1
      expect(@rover.y).to eq 1
    end

    it 'has an initial direction' do
      expect(@rover.dir).to eq 'N'
    end
    it 'has a grid to move on' do
      expect(@rover.grid.class).to eq Grid
    end

  end
  context 'when moving' do
    it 'can move north' do
      expect(@rover.move).to eq [1,2]
    end

    it 'can move south' do
			@rover.turn_left
			@rover.turn_left
      expect(@rover.move).to eq [1,0]
    end
		
    it 'can move west' do
			@rover.turn_left
      expect(@rover.move).to eq [0,1]
    end
		
    it 'can move east' do
			@rover.turn_right
      expect(@rover.move).to eq [2,1]
    end

  end

  it 'can turn left' do
    expect(@rover.turn_left).to eq 'W'
  end

  it 'can turn right' do
    expect(@rover.turn_right).to eq 'E'
  end
end



