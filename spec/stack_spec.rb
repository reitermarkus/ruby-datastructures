#!/usr/bin/env ruby

require 'spec_helper'
require 'stack'

describe Stack do
  let(:empty_stack) { described_class.new }

  let(:three_item_stack) {
    one_item = described_class.new
    one_item.push(:one)
    one_item.push(:two)
    one_item.push(:three)
  }

  describe '#empty?' do
    it 'returns true for a new instance' do
      expect(empty_stack).to be_empty
    end

    it 'returns false if a new instance is initialized with a value' do
      expect(described_class.new(27)).not_to be_empty
    end

    it 'returns false for an instance with three values' do
      expect(three_item_stack).not_to be_empty
    end
  end

  describe '#size' do
    it 'returns 0 for a new instance' do
      expect(empty_stack.size).to eq 0
    end

    it 'returns 1 if a new instance is initialized with a value' do
      expect(described_class.new(27).size).to eq 1
    end

    it 'returns 3 for an instance with three values' do
      expect(three_item_stack.size).to eq 3
    end
  end

  describe '#pop' do
    it 'raises an IndexError if empty' do
      expect { empty_stack.pop }.to raise_error(IndexError)
    end

    it 'returns the top element and decreases the size' do
      [[3, :three], [2, :two], [1, :one]].each do |size, value|
        expect(three_item_stack.size).to eq size
        expect(three_item_stack.pop).to eq value
      end

      expect(three_item_stack.size).to eq 0
    end
  end

  describe '#top' do
    it 'returns the top element without removing it' do
      expect(three_item_stack.size).to eq 3
      expect(three_item_stack.top).to eq :three
      expect(three_item_stack.size).to eq 3
      expect(three_item_stack.top).not_to eq :two
      expect(three_item_stack.size).to eq 3
    end
  end

  describe '#push' do
    let(:stack) { empty_stack }

    it 'returns itself' do
      expect(stack.push(:value)).to eq stack
    end

    it 'adds an element to the top and increases the size' do
      expect(stack.size).to eq 0
      expect(stack.push(:one).size).to eq 1
      expect(stack.push(:two).size).to eq 2
      expect(stack.push(:three).size).to eq 3
    end
  end

  describe '#to_s' do
    it 'if empty, returns "[]"' do
      expect(empty_stack.to_s).to eq '[]'
    end

    it 'returns contained items in the format "[:one, :two, :three]"' do
      expect(three_item_stack.to_s).to eq '[one, two, three]'
    end
  end
end
