#!/usr/bin/env ruby

require 'spec_helper'
require 'hash/conversions/array'

describe Array do
  describe '#to_h' do
    it 'converts a two-dimensional array to a hash' do
      expect([[:key, :value]].to_h).to eq(key: :value)
    end

    it 'raises an error when it is not a two-dimensional array' do
      expect {
        [:value].to_h
      }.to raise_error TypeError,
                       'wrong element type Symbol at 0 (expected array)'
    end

    it 'raises an error when the an array does not have two elements' do
      expect {
        [[:value]].to_h
      }.to raise_error ArgumentError,
                       'wrong array length at 0 (expected 2, was 1)'
    end
  end
end
