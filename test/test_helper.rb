#!/usr/bin/env ruby

require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'coveralls'
Coveralls.wear!

require 'test/unit'
