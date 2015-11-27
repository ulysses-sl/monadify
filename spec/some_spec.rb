require 'spec_helper'

describe Monadify::Some do
  let(:subject) { Monadify::Some.new('2') }

  describe 'map' do
    context 'from successful expression' do
      it 'should return Some' do
        result = subject.map(&:to_i)
        expect(result).to be_a(Monadify::Some)
        expect(result.value).to eq(2)
      end
    end

    context 'from expression that return nil' do
      it 'should return None' do
        result = subject.map { nil }
        expect(result).to be_a(Monadify::None)
      end
    end

    context 'from expression that raise exceptions' do
      it 'should return None' do
        result = subject.map(&:*)
        expect(result).to be_a(Monadify::None)
      end
    end
  end

  describe 'flatmap' do
  end
end
