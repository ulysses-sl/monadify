require 'monadify/version'

directory = File.dirname(File.absolute_path(__FILE__))
require "#{directory}/monadify/option/option"
Dir.glob("#{directory}/monadify/**/*.rb") { |file| require file }

module Monadify
  # Your code goes here...
end
