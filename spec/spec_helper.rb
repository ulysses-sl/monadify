require 'bundler/setup'
Bundler.setup

require 'monadify'
require 'rspec'


RSpec.configure do |config|
  config.order = 'random'
end
