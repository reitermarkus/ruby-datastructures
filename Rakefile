#!/usr/bin/env ruby

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

task default: %w(test)

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
end
