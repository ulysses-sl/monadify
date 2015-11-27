require 'spec_helper'

describe Monadify::None do
  let(:subject) { Monadify::None.new }

  describe 'map' do
    it 'should return itself' do
      result = subject.map(&:to_i)
      expect(result).to be_a(Monadify::None)
    end
  end

  describe 'flatmap' do
    it 'should return itself' do
      result = subject.map(&:to_i)
      expect(result).to be_a(Monadify::None)
    end
  end
end
