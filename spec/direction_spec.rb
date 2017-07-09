require 'spec_helper'
require 'direction'

describe Direction do
  let(:extended_class) { Class.new { extend Direction } }

  context 'when facing north' do
    it 'returns west after turning left' do
      expect(extended_class.N 'L').to eq 'W'
    end

    it 'returns east after turning right' do
      expect(extended_class.N 'R').to eq 'E'
    end
  end

  context 'when facing east' do
    it 'returns north after turning left' do
      expect(extended_class.E 'L').to eq 'N'
    end

    it 'returns south after turning right' do
      expect(extended_class.E 'R').to eq 'S'
    end
  end

  context 'when facing south' do
    it 'returns east after turning left' do
      expect(extended_class.S 'L').to eq 'E'
    end

    it 'returns west after turning right' do
      expect(extended_class.S 'R').to eq 'W'
    end
  end

  context 'when facing west' do
    it 'returns south after turning left' do
      expect(extended_class.W 'L').to eq 'S'
    end

    it 'returns north after turning right' do
      expect(extended_class.W 'R').to eq 'N'
    end
  end
end
