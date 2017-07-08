require 'spec_helper'
require 'grid'

describe Grid do
  before(:each) do
    @grid = Grid.new [2,2]
  end

  it 'has a size' do
    expect(@grid.bounds).to eq [2,2]
  end

  context 'checking borders' do

    it 'when position is inside it returns true' do
      expect(@grid.are_inside? [1,2]).to eq true
    end

    it 'when position is outside it returns false' do
      expect(@grid.are_inside? [3,2]).to eq false
    end
  end

  context 'returning an updated position' do
    before(:each) do
      @starting_point = [1,1]
    end
    it 'when direction is east' do
      expect(@grid.calculate_position('E', @starting_point)).to eq [2,1]
    end

    it 'when direction is west' do
      expect(@grid.calculate_position('W', @starting_point)).to eq [0,1]
    end

    it 'when direction is north' do
      expect(@grid.calculate_position('N', @starting_point)).to eq [1,2]
    end

    it 'when direction is south' do
      expect(@grid.calculate_position('S', @starting_point)).to eq [1,0]
    end
  end
  context 'can throw errors' do
    it 'when coordinates point outside of the grid' do
      starting_point = [2,2]
      error_message = 'this position is not inside the grid'
      expect{@grid.calculate_position('N', starting_point)}.to raise_error(StandardError, error_message)
    end
  end
end

