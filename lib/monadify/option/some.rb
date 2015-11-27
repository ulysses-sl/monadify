class NotAnOptionError < TypeError; end

class Monadify::Some < Monadify::Option
  attr_reader :value

  def initialize(val)
    @value = val
  end

  def empty?
    false
  end

  def map
    begin
      return_val = yield value
      if return_val.nil?
        Monadify::None.new
      else
        Monadify::Some.new(return_val)
      end
    rescue ArgumentError, NameError, TypeError
      raise
    rescue
      Monadify::None.new
    end
  end

  def flatmap
    begin
      return_option = yield value
      case return_option
      when Monadify::None
        return_option
      when Monadify::Some
        Monadify::Some.new(return_option.value)
      # when the yield value succeeds?
      else
        raise NotAnOptionError
      end
    rescue NotAnOptionError
      raise ArgumentError, 'The block should return an Option'
    rescue ArgumentError, NameError, TypeError
      raise
    rescue
      Monadify::None.new
    end
  end
end

