require 'spec_helper'
require 'rover'
require 'grid'
require 'helpers'

RSpec.configure do |c|
  c.include Helpers
end

describe Rover do
  grid = Grid.new([5, 5])
  subject(:rover) { Rover.new(1, 1, 'N', grid) }

  context 'when created' do
    it 'has an initial position expressed with coordinates' do
      expect(rover.x).to eq 1
      expect(rover.y).to eq 1
    end

    it 'has an initial direction' do
      expect(rover.direction).to eq 'N'
    end

    it 'knows its position and direction' do
      position = rover.return_position
      expect(position).to eq '1 1 N'
    end
  end
  context 'when moving from position 1,1 on the grid' do
    it 'can move north' do
      expect(rover.move).to eq [1, 2]
    end

    it 'can move east' do
      rover.turn_right
      expect(rover.move).to eq [2, 1]
    end

    it 'can move south' do
      rover.turn_left
      rover.turn_left
      expect(rover.move).to eq [1, 0]
    end

    it 'can move west' do
      rover.turn_left
      expect(rover.move).to eq [0, 1]
    end
  end

  context 'when facing north' do
    it 'can turn left and face west' do
      rover.turn_left
      expect(rover.direction).to eq 'W'
    end

    it 'can turn right and face east' do
      rover.turn_right
      expect(rover.direction).to eq 'E'
    end
  end

  context 'when facing east' do
    let(:rover) { create_rover('E') }

    it 'can turn left and face north' do
      rover.turn_left
      expect(rover.direction).to eq 'N'
    end

    it 'can turn right and face south' do
      rover.turn_right
      expect(rover.direction).to eq 'S'
    end
  end

  context 'when facing south' do
    let(:rover) { create_rover('S') }

    it 'can turn left and face east' do
      rover.turn_left
      expect(rover.direction).to eq 'E'
    end

    it 'can turn right and face west' do
      rover.turn_right
      expect(rover.direction).to eq 'W'
    end
  end

  context 'when facing west' do
    let(:rover) { create_rover('W') }

    it 'can turn left and face south' do
      rover.turn_left
      expect(rover.direction).to eq 'S'
    end

    it 'can turn right and face north' do
      rover.turn_right
      expect(rover.direction).to eq 'N'
    end
  end

  context 'when receiving commands' do
    it 'can process an empty commands\' array' do
      old_position = '1 1 N'
      new_position = rover.process_commands []
      expect(new_position).to eq old_position
    end

    it 'can process an array with multiple commands' do
      commands = ['M', 'L', 'M']
      new_position = rover.process_commands commands
      expect(new_position).to eq '0 2 W'
    end

    it 'will throw an error for unrecognized commands' do
      commands = ['M', 'L', 'S']
      error_message = 'this is not a valid command'
      expect{rover.process_commands commands}
        .to raise_error(StandardError, error_message)
    end
  end
end
