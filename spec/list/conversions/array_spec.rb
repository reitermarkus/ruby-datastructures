#!/usr/bin/env ruby

require 'spec_helper'
require 'list'

describe Array do
  let(:three_item_array) {
    one_item = described_class.new
    one_item.push(:one)
    one_item.push(:two)
    one_item.push(:three)
  }

  let(:empty_list) { List.new }

  let(:three_item_list) {
    one_item = List.new
    one_item.append(:one)
    one_item.append(:two)
    one_item.append(:three)
  }

  describe '#to_l' do
    it 'if empty, returns empty list' do
      expect(described_class.new.to_l).to eq(List.new)
    end

    it 'converts an array with three items correctly' do
      expect(three_item_array.to_l).to eq(three_item_list)
    end
  end
end
