#!/usr/bin/env ruby

require 'rake/testtask'

Rake::TestTask.new do |task|
  task.libs << 'lib'
  task.libs << 'test'
  task.test_files = FileList['test/**/*_test.rb']
  task.verbose = true
end

task default: %w(test)
