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
      if return_option.is_a? Monadify::Option
        if return_option.empty?
          Monadify::None.new
        else
          Monadify::Some.new(return_option.value)
        end
      elsif
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

