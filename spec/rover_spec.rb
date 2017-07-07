require "spec_helper"
require "rover"

describe Rover do
  before(:each) do
    @rover = Rover.new(1, 1, 'N')
  end

  it 'has an initial position' do
    expect(@rover.x).to eq 1
    expect(@rover.y).to eq 1
  end

  it 'has an initial direction' do
    expect(@rover.dir).to eq 'N'
  end

  it 'can move' do
    expect(@rover.move).to eq true
  end

  it 'can turn left' do
    expect(@rover.turn_left).to eq true
  end

  it 'can turn right' do
    expect(@rover.turn_right).to eq true
  end
end



