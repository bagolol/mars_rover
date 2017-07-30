require 'spec_helper'
require 'rover'
require 'grid'
require 'helpers'

RSpec.configure do |c|
  c.include Helpers
end

describe Rover do
  grid = Grid.new([5, 5])
  subject(:rover) {
    Rover.new({
      :x => 1,
      :y => 1,
      :dir => 'N',
      :grid => grid
    })
  }

  context 'when created' do
    it 'has an initial direction' do
      expect(rover.direction).to eq 'N'
    end

    it 'knows its position and direction' do
      position = rover.process_commands([])
      expect(position).to eq '1 1 N'
    end
  end
  context 'when moving from position 1,1 on the grid' do
    it 'can move north' do
      commands = ['move']
      expect(rover.process_commands(commands)).to eq '1 2 N'
    end

    it 'can move east' do
      commands = ['turn_right', 'move']
      expect(rover.process_commands(commands)).to eq '2 1 E'
    end

    it 'can move south' do
      commands = ['turn_left', 'turn_left', 'move']
      expect(rover.process_commands(commands)).to eq '1 0 S'
    end

    it 'can move west' do
      commands = ['turn_left', 'move']
      expect(rover.process_commands(commands)).to eq '0 1 W'
    end
  end

  context 'when receiving commands' do
    it 'can process an empty commands\' array' do
      old_position = '1 1 N'
      new_position = rover.process_commands []
      expect(new_position).to eq old_position
    end

    it 'can process an array with multiple commands' do
      commands = %w[move turn_left move]
      new_position = rover.process_commands commands
      expect(new_position).to eq '0 2 W'
    end

    it 'will throw an error for unrecognized commands' do
      commands = %w[move turn_left FOO]
      error_message = 'this is not a valid command'
      expect { rover.process_commands commands }
        .to raise_error(StandardError, error_message)
    end
  end
end
