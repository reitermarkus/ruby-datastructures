#!/usr/bin/env ruby

require 'rake/testtask'

require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'coveralls'
Coveralls.wear!

task default: %w(test)

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
end
