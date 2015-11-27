# use:  Option.from {  execute block  }
module Monadify::Option
  def self.from
    begin
      val = yield
      if val.nil?
        Monadify::None.new
      else
        Monadify::Some.new(val)
      end
    rescue
      Monadify::None.new
    end
  end
end

