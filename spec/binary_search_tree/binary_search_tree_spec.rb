#!/usr/bin/env ruby

require 'spec_helper'
require 'binary_search_tree'

describe BinarySearchTree do
  let(:tree) { described_class.new }

  describe '#insert' do
    it 'returns itself' do
      expect(tree.insert(:key, :value)).to eq(tree)
    end

    it 'inserts an element with key and value' do
      tree.insert(33, :pineapple)
      expect(tree.find(33)).to eq(:pineapple)
    end
  end

  describe '#find' do
    let(:shuffled_array) {
      [
        [94, :strawberry],
        [33, :pineapple],
        [48, :mango],
        [18, :melon],
        [82, :apple]
      ]
    }

    let(:sorted_array) { shuffled_array.sort }
    let(:reverse_sorted_array) { sorted_array.reverse }

    it 'if empty, returns nil' do
      expect(tree.find(94)).to be nil
    end

    it 'returns nil if element is not in tree' do
      shuffled_array.each do |k, v|
        tree.insert(k, v)
      end

      expect(tree.find(27)).to be nil
    end

    it 'finds and item in a tree created with a shuffled array' do
      shuffled_array.each do |k, v|
        tree.insert(k, v)
      end

      expect(tree.find(18)).to eq(:melon)
    end

    it 'finds and item in a tree created with a sorted array' do
      sorted_array.each do |k, v|
        tree.insert(k, v)
      end

      expect(tree.find(82)).to eq(:apple)
    end

    it 'finds and item in a tree created with a reverse sorted array' do
      reverse_sorted_array.each do |k, v|
        tree.insert(k, v)
      end

      expect(tree.find(33)).to eq(:pineapple)
    end
  end

  describe '#each' do
    let(:tree) {
      tree = described_class.new
      tree.insert(94, :strawberry)
      tree.insert(18, :melon)
      tree.insert(48, :mango)
    }

    it 'iterates over the elements in sorted order' do
      tree.each.tap { |enum|
        expect(enum.next).to eq(:melon)
        expect(enum.next).to eq(:mango)
        expect(enum.next).to eq(:strawberry)
      }
    end
  end

  describe '#to_a' do
    it 'returns a sorted array' do
      tree.insert(94, :strawberry)
      tree.insert(48, :mango)
      tree.insert(18, :melon)

      expect(tree.to_a).to eq([:melon, :mango, :strawberry])
    end
  end
end
