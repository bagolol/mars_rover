require 'spec_helper'
require 'direction'

describe Direction do
  context 'when coming from north' do
    it 'returns "E" when turning right' do
      new_dir = Direction.calc_new('N', 'R')
      expect(new_dir).to eq('E')
    end
    it 'returns "W" when turning left' do
      new_dir = Direction.calc_new('N', 'L')
      expect(new_dir).to eq('W')
    end
  end

  context 'when coming from east' do
    it 'returns "S" when turning right' do
      new_dir = Direction.calc_new('E', 'R')
      expect(new_dir).to eq('S')
    end
    it 'returns "N" when turning left' do
      new_dir = Direction.calc_new('E', 'L')
      expect(new_dir).to eq('N')
    end
  end

  context 'when coming from south' do
    it 'returns "W" when turning right' do
      new_dir = Direction.calc_new('S', 'R')
      expect(new_dir).to eq('W')
    end
    it 'returns "E" when turning left' do
      new_dir = Direction.calc_new('S', 'L')
      expect(new_dir).to eq('E')
    end
  end

  context 'when coming from west' do
    it 'returns "N" when turning right' do
      new_dir = Direction.calc_new('W', 'R')
      expect(new_dir).to eq('N')
    end
    it 'returns "S" when turning left' do
      new_dir = Direction.calc_new('W', 'L')
      expect(new_dir).to eq('S')
    end
  end

  context 'when given an invalid direction' do
    it 'raises a "not valid direction" error' do
      error_message = 'not a valid direction'
      expect { Direction.calc_new('W', 'FOO') }.to raise_error(error_message)
    end
  end

  context 'when given an invalid cardinal point' do
    it 'raises a "not valid cardinal point" error' do
      error_message = 'not a valid cardinal point'
      expect { Direction.calc_new('FOO', 'L') }.to raise_error(error_message)
    end
  end
end
