require 'rubygems'
require 'cucumber/rails'
require 'spork'

Spork.prefork do
  # Sets up the Rails environment for Cucumber
  ENV["RAILS_ENV"] ||= "test"
  require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')
  
  Capybara.default_selector = :css
  
  ActionController::Base.allow_rescue = false
end

Spork.each_run do
  PackageTracker::Application.reload_routes!
end
