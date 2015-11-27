class Monadify::None < Monadify::Option
  def empty?
    true
  end

  def map
    begin
      yield nil
    rescue ArgumentError, NameError, TypeError
      raise
    rescue
    end
    self
  end

  def flatmap
    begin
      yield nil
    rescue NotAnOptionError
      raise ArgumentError, 'The block should return an Option'
    rescue ArgumentError, NameError, TypeError
      raise
    rescue
    end
    self
  end
end
