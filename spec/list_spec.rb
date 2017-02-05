#!/usr/bin/env ruby

require 'spec_helper'
require 'list'

describe List do
  let(:empty_list) { described_class.new }

  let(:three_item_list) {
    list = described_class.new
    list.append(:one)
    list.append(:two)
    list.append(:three)
  }

  describe '#empty?' do
    it 'returns true for a new instance' do
      expect(empty_list).to be_empty
    end

    it 'returns false if a new instance is initialized with a value' do
      expect(described_class.new(27)).not_to be_empty
    end

    it 'returns false for an instance with three values' do
      expect(three_item_list).not_to be_empty
    end
  end

  describe '#length' do
    it 'returns 0 for a new instance' do
      expect(empty_list.length).to eq 0
    end

    it 'returns 1 if a new instance is initialized with a value' do
      expect(described_class.new(27).length).to eq 1
    end

    it 'returns 3 for an instance with three values' do
      expect(three_item_list.length).to eq 3
    end
  end

  describe '#append' do
    let(:list) { empty_list }

    it 'increases the length' do
      expect(list.length).to eq 0
      expect(list.append(:value))
      expect(list.length).to eq 1
    end

    it 'adds an element to the end' do
      expect(list.append(:one))
      expect(list.last).to eq :one
      expect(list.append(:two))
      expect(list.last).to eq :two
    end

    it 'returns itself' do
      expect(list.append(:value)).to eq list
    end
  end

  describe '#prepend' do
    let(:list) { empty_list }

    it 'increases the length' do
      expect(list.length).to eq 0
      expect(list.prepend(:value))
      expect(list.length).to eq 1
    end

    it 'adds an element to the front' do
      expect(list.prepend(:one))
      expect(list.first).to eq :one
      expect(list.prepend(:two))
      expect(list.first).to eq :two
    end

    it 'returns itself' do
      expect(list.prepend(:value)).to eq list
    end
  end

  describe '#first' do
    it 'returns the first element' do
      expect(three_item_list.first).to eq :one
    end
  end

  describe '#last' do
    it 'returns the last element' do
      expect(three_item_list.last).to eq :three
    end
  end

  describe '#get' do
    it 'returns the item at the given index' do
      expect(three_item_list.get(0)).to eq :one
      expect(three_item_list.get(1)).to eq :two
      expect(three_item_list.get(2)).to eq :three
    end

    it 'supports negative indices' do
      expect(three_item_list.get(-1)).to eq :three
      expect(three_item_list.get(-2)).to eq :two
      expect(three_item_list.get(-3)).to eq :one
    end
  end

  describe '#insert' do
    let(:list) { three_item_list }

    it 'inserts the item at the given index' do
      expect(list.get(1)).to eq :two
      list.insert(1, :one_and_a_half)
      expect(list.get(1)).to eq :one_and_a_half
      expect(list.get(2)).to eq :two
    end

    it 'supports negative indices' do
      expect(list.get(1)).to eq :two
      list.insert(-2, :one_and_a_half)
      expect(list.get(1)).to eq :one_and_a_half
      expect(list.get(2)).to eq :two
    end

    it 'adds padding nil objects when given an index that does not exist' do
      empty_list.insert(3, :four)
      expect(empty_list.get(0)).to be nil
      expect(empty_list.get(1)).to be nil
      expect(empty_list.get(2)).to be nil
      expect(empty_list.get(3)).to eq :four
    end
  end

  describe '#set' do
    let(:list) { three_item_list }

    it 'returns itself' do
      expect(list.set(1, :value)).to eq list
    end

    it 'replaces an item at a given index with a given item' do
      expect(list.get(1)).to eq :two
      list.set(1, :was_two)
      expect(list.get(1)).to eq :was_two
    end
  end

  describe '#delete' do
    let(:list) { three_item_list }

    it 'deletes the item at the given index and returns it' do
      expect(list.length).to eq 3
      expect(list.delete(1)).to eq :two
      expect(list.length).to eq 2
    end

    it 'can remove the first item' do
      expect(list.length).to eq 3
      expect(list.first).to eq :one
      expect(list.delete(0)).to eq :one
      expect(list.first).to eq :two
      expect(list.length).to eq 2
    end

    it 'can remove the last item' do
      expect(list.length).to eq 3
      expect(list.last).to eq :three
      expect(list.delete(-1)).to eq :three
      expect(list.last).to eq :two
      expect(list.length).to eq 2
    end

    it 'raises an error if the index does not exist' do
      expect(list.delete(2)).to eq(:three)

      expect {
        list.delete(2)
      }.to raise_error IndexError
    end
  end

  describe '#each' do
    it 'can be iterated' do
      iterator = three_item_list.each

      expect(iterator.next).to eq :one
      expect(iterator.next).to eq :two
      expect(iterator.next).to eq :three
    end
  end

  describe '#reverse_each' do
    it 'can be iterated in reversed order' do
      iterator = three_item_list.reverse_each

      expect(iterator.next).to eq :three
      expect(iterator.next).to eq :two
      expect(iterator.next).to eq :one
    end
  end

  describe '#==' do
    it 'returns false if the two lists do not contain the same elements' do
      expect(three_item_list).not_to eq(empty_list)
    end

    it 'returns true if the two lists contain the same elements' do
      expect(three_item_list).to eq(three_item_list)
    end
  end

  describe '#to_a' do
    it 'if empty, returns an empty Array' do
      expect(empty_list.to_a).to eq []
    end

    it 'returns an Array containing all items' do
      expect(three_item_list.to_a).to eq [:one, :two, :three]
    end
  end

  describe '#to_s' do
    it 'if empty, returns "()"' do
      expect(empty_list.to_s).to eq '()'
    end

    it 'returns contained items in the format "(:one, :two, :three)"' do
      expect(three_item_list.to_s).to eq '(:one, :two, :three)'
    end
  end
end
