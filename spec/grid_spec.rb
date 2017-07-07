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
	context 'returning offset' do
		it 'returns the east offset' do
			expect(@grid.return_offset 'E').to eq [1,0]
		end

		it 'returns the west offset' do
			expect(@grid.return_offset 'W').to eq [-1,0]
		end

		it 'returns the north offset' do
			expect(@grid.return_offset 'N').to eq [0,1]
		end

		it 'returns the south offset' do
			expect(@grid.return_offset 'S').to eq [0,-1]
		end
	end
end

