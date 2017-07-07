require 'spec_helper'
require 'grid'

describe Grid do
  before(:each) do
    @grid = Grid.new [2,2]
  end

  it 'has a size' do
    expect(@grid.size).to eq [2,2]
  end

  it 'can tell if the rover is within' do
    expect(@grid.is_within?).to eq false
  end

end

