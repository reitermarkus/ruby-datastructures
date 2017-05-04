#!/usr/bin/env ruby

require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = '--color --format documentation'
end

RuboCop::RakeTask.new do |task|
  task.requires << 'rubocop-rspec'
  task.options << '--display-cop-names'
end

task default: %w[rubocop spec]
