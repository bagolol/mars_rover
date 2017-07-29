require 'spec_helper'
require 'mars_rover_parser'

describe MarsRoverParser do
  subject(:m_r_s) { MarsRoverParser.new('foo') }

  it 'is a subclass of Parser' do
    expect(MarsRoverParser.superclass.to_s).to eq 'Parser'
  end

  context 'given a string' do
    it 'returns the grid_size as an array of integers' do
      grid_size = m_r_s.parse_grid_size '1 1'
      expect(grid_size).to eq [1, 1]
    end

    it 'returns an array of coordinates and a direction' do
      position = m_r_s.parse_position '1 1 N'
      expect(position).to eq [1, 1, 'N']
    end

    it 'returns an array of executable commands' do
      commands = m_r_s.parse_commands 'LRM'
      expect(commands).to eq %w[turn_left turn_right move]
    end
  end
end
