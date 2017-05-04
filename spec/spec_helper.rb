#!/usr/bin/env ruby

require 'rspec/its'

if ENV['CI']
  require 'coveralls'
  Coveralls.wear!
else
  require 'simplecov'
  SimpleCov.start
end
