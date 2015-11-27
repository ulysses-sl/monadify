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

    context 'from expression that raise special types of errors' do
      it 'should raise the exception' do
        expect { subject.map { |el| el.concat(String) } }.to raise_error(TypeError)
      end
    end

    # This spec is not passing. map raises NoMethodError here
    context 'from expression that raise other exceptions' do
      it 'should return None' do
        result = subject.map { |el| el^2 }
        expect(result).to be_a(Monadify::None)
      end
    end
  end

  describe 'flatmap' do
    context 'from successful expression' do
      it 'should return Some' do
        pending
      end
    end

    context 'from expression that is not an option' do
      it 'should return None' do
        pending
      end
    end

    context 'from expression that raise special types of errors' do
      it 'should raise the exception' do
        pending
      end
    end

    context 'from expression that raise other exceptions' do
      it 'should return None' do
        pending
      end
    end
  end
end
