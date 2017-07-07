require "spec_helper"
require "rover"

describe Rover do
  before(:each) do
    @rover = Rover.new 'mars_rover'
  end

  context 'when initialised' do
    it 'has a name' do
      expect(@rover.name).to eq 'mars_rover'
    end
  end
end



