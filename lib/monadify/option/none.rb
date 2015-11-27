class Monadify::None < Monadify::Option
  def empty?
    true
  end

  def map
    begin
      yield nil
    rescue ArgumentError, NameError
      raise
    rescue
    end
    self
  end

  def flatmap
    begin
      yield nil
    rescue ArgumentError, NameError
      raise
    rescue
    end
    self
  end
end
