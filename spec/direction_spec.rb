require 'spec_helper'
require 'direction'

describe Direction do
	let(:extended_class) { Class.new { extend Direction } }

	context 'coming from north' do
		it 'returns west when turning left' do
			expect(extended_class.north 'L').to eq 'W'
		end

		it 'returns east when turning right' do
			expect(extended_class.north 'R').to eq 'E'
		end
	end

	context 'coming from south' do
		it 'returns east when turning left' do
			expect(extended_class.south 'L').to eq 'E'
		end

		it 'returns west when turning right' do
			expect(extended_class.south 'R').to eq 'W'
		end
	end

	context 'coming from west' do
		it 'returns south when turning left' do
			expect(extended_class.west 'L').to eq 'S'
		end

		it 'returns north when turning right' do
			expect(extended_class.west 'R').to eq 'N'
		end
	end

	context 'coming from east' do
		it 'returns north when turning left' do
			expect(extended_class.east 'L').to eq 'N'
		end

		it 'returns south when turning right' do
			expect(extended_class.east 'R').to eq 'S'
		end
	end

end
