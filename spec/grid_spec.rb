require 'spec_helper'
require 'grid'

describe Grid do
  subject(:grid) { Grid.new [2, 2] }

  it 'has a size' do
    expect(grid.bounds).to eq [2, 2]
  end

  context 'when checking borders' do
    it 'returns true if borders are not exceeded' do
      expect(grid.are_inside?([1, 2])).to eq true
    end

    it 'returns false if borders are exceeded' do
      expect(grid.are_inside?([3, 2])).to eq false
    end
  end

  context 'when coordinates point outside' do
    it 'raises an error with a message' do
      starting_point = [2, 2]
      error_message = 'this position is not inside the grid'
      expect { grid.calculate_position('N', starting_point) }
        .to raise_error(StandardError, error_message)
    end
  end

  context 'when facing an invalid direction' do
    it 'raises an error with a message' do
      starting_point = [2, 2]
      error_message = 'this direction is invalid'
      expect { grid.calculate_position('FOO', starting_point) }
        .to raise_error(StandardError, error_message)
    end
  end

  context 'returning an updated position' do
    let(:starting_point) { [1, 1] }

    it 'when direction is north' do
      expect(grid.calculate_position('N', starting_point)).to eq [1, 2]
    end

    it 'when direction is east' do
      expect(grid.calculate_position('E', starting_point)).to eq [2, 1]
    end

    it 'when direction is south' do
      expect(grid.calculate_position('S', starting_point)).to eq [1, 0]
    end

    it 'when direction is west' do
      expect(grid.calculate_position('W', starting_point)).to eq [0, 1]
    end
  end
end
