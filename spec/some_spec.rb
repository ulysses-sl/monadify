require 'spec_helper'
class IAmJustARandomError < StandardError; end

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
      it 'should raise TypeError' do
        expect { subject.map { |el| el.concat(String) } }
          .to raise_error(TypeError)
      end

      it 'should raise NoMethodError' do
        expect { subject.map { |el| el^2 } }
          .to raise_error(NoMethodError)
      end
    end

    context 'from expression that raise other exceptions' do

      it 'should return None' do
        result = subject.map { raise IAmJustARandomError }
        expect(result).to be_a(Monadify::None)
      end
    end
  end

  describe 'flatmap' do
    context 'from expression that return None' do
      it 'should return None' do
        result = subject.flatmap { |el| Monadify::Option.from { el.to_i / 0 } }
        expect(result).to be_a(Monadify::None)
      end
    end

    context 'from expression that return Some' do
      it 'should return Some' do
        result = subject.flatmap { |el| Monadify::Option.from { el.to_i / 2 } }
        expect(result).to be_a(Monadify::Some)
      end
    end

    context 'from expression that is not an option' do
      it 'should raise Argument Exception' do
        expect { subject.flatmap { |el| el.to_i / 2 } }
          .to raise_error(ArgumentError)
      end
    end

    context 'from expression that raise special types of errors' do
      it 'should raise the exception' do
        expect { subject.flatmap { Monadify::Option.from { |el| el.concat(String) } } }
          .to raise_error(NoMethodError)
      end
    end

    context 'from expression that raise other exceptions' do
      it 'should return None' do
        result = subject.flatmap { Monadify::Option.from { raise IAmJustARandomError } }
        expect(result).to be_a(Monadify::None)
      end
    end
  end
end
