require 'spec_helper'
require 'direction'

describe Direction do
	before(:each) do
		@direction = Direction.new
	end
	context 'coming from north' do
		it 'returns west when turning left' do
			expect(@direction.north 'L').to eq 'W'
		end

		it 'returns east when turning right' do
			expect(@direction.north 'R').to eq 'E'
		end
	end

	context 'coming from south' do
		it 'returns east when turning left' do
			expect(@direction.south 'L').to eq 'E'
		end

		it 'returns west when turning right' do
			expect(@direction.south 'R').to eq 'W'
		end
	end

	context 'coming from west' do
		it 'returns south when turning left' do
			expect(@direction.west 'L').to eq 'S'
		end

		it 'returns north when turning right' do
			expect(@direction.west 'R').to eq 'N'
		end
	end

	context 'coming from east' do
		it 'returns north when turning left' do
			expect(@direction.east 'L').to eq 'N'
		end

		it 'returns south when turning right' do
			expect(@direction.east 'R').to eq 'S'
		end
	end

end
