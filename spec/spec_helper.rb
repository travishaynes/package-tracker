require 'rubygems'
require 'spork'

Spork.prefork do
  require 'simplecov'
  SimpleCov.start
  
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  
  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
  RSpec.configure do |config|
    config.mock_with :rspec
  end

end

Spork.each_run do
end

