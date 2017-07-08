require 'spec_helper'
require 'rover'
require 'grid'
require 'helpers'

RSpec.configure do |c|
  c.include Helpers
end

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
      expect(@rover.direction).to eq 'N'
    end
    it 'knows its position and direction' do
      position = @rover.return_position
      expect(position).to eq '1 1 N'
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

  context 'when facing north' do
    it 'can turn left and face west' do
      @rover.turn_left
      expect(@rover.direction).to eq 'W'
    end

    it 'can turn right and face east' do
      @rover.turn_right
      expect(@rover.direction).to eq 'E'
    end
  end

  context 'when facing south' do
    before(:each) do
      @rover = create_rover('S')
    end
    it 'can turn left and face east' do
      @rover.turn_left
      expect(@rover.direction).to eq 'E'
    end

    it 'can turn right and face west' do
      @rover.turn_right
      expect(@rover.direction).to eq 'W'
    end
  end

  context 'when facing east' do
    before(:each) do
      @rover = create_rover('E')
    end
    it 'can turn left and face north' do
      @rover.turn_left
      expect(@rover.direction).to eq 'N'
    end

    it 'can turn right and face south' do
      @rover.turn_right
      expect(@rover.direction).to eq 'S'
    end
  end

  context 'when facing west' do
    before(:each) do
      @rover = create_rover('W')
    end
    it 'can turn left and face south' do
      @rover.turn_left
      expect(@rover.direction).to eq 'S'
    end

    it 'can turn right and face north' do
      @rover.turn_right
      expect(@rover.direction).to eq 'N'
    end
  end

  context 'when given complex instructions' do
    before(:each) do
      @grid = Grid.new([5,5])
    end

    it 'moves according to LMLMLMLMM' do
      rover = Rover.new(1,2,'N', @grid)
      rover.turn_left
      rover.move
      rover.turn_left
      rover.move
      rover.turn_left
      rover.move
      rover.turn_left
      rover.move
      rover.move
      expect(rover.return_position).to eq '1 3 N'
    end

    it 'moves according to MMRMMRMRRM' do
      rover = Rover.new(3,3, 'E', @grid)
      rover.move
      rover.move
      rover.turn_right
      rover.move
      rover.move
      rover.turn_right
      rover.move
      rover.turn_right
      rover.turn_right
      rover.move
      expect(rover.return_position).to eq '5 1 E'
    end
  end

end



