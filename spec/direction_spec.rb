require 'spec_helper'
require 'direction'

describe Direction do
  let(:extended_class) { Class.new { extend Direction } }

  context 'coming from north' do
    it 'returns west when turning left' do
      expect(extended_class.N 'L').to eq 'W'
    end

    it 'returns east when turning right' do
      expect(extended_class.N 'R').to eq 'E'
    end
  end

  context 'coming from south' do
    it 'returns east when turning left' do
      expect(extended_class.S 'L').to eq 'E'
    end

    it 'returns west when turning right' do
      expect(extended_class.S 'R').to eq 'W'
    end
  end

  context 'coming from west' do
    it 'returns south when turning left' do
      expect(extended_class.W 'L').to eq 'S'
    end

    it 'returns north when turning right' do
      expect(extended_class.W 'R').to eq 'N'
    end
  end

  context 'coming from east' do
    it 'returns north when turning left' do
      expect(extended_class.E 'L').to eq 'N'
    end

    it 'returns south when turning right' do
      expect(extended_class.E 'R').to eq 'S'
    end
  end

end
