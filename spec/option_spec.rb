require 'spec_helper'

describe Monadify::Option do
  describe 'self.from' do
    context 'Option from successful expression' do
      it 'should return Some' do
        result = Monadify::Option.from { 2 + 2 }
        expect(result).to be_a(Monadify::Some)
        expect(result.value).to eq(4)
      end
    end

    context 'Option from expression that return nil' do
      it 'should return None' do
        result = Monadify::Option.from { nil }
        expect(result).to be_a(Monadify::None)
      end
    end

    context 'Option from expression that raise exceptions' do
      it 'should return None' do
        result = Monadify::Option.from { 2 + '2' }
        expect(result).to be_a(Monadify::None)
      end
    end
  end
end
