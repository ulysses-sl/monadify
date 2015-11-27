# use:  Option.from {  execute block  }
class Monadify::Option
  def self.from
    begin
      val = yield
      if val.nil?
        Monadify::None.new
      else
        Monadify::Some.new(val)
      end
    rescue ArgumentError, NameError, TypeError
      raise
    rescue
      Monadify::None.new
    end
  end
end
