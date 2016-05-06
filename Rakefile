#!/usr/bin/env ruby

task default: %w(test)

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
end
