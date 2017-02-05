#!/usr/bin/env ruby

require 'spec_helper'
require 'heap'

describe MinHeap do
  let(:heap) { described_class.new }

  describe '#insert' do
    it 'inserts an element into the heap' do
      heap.insert(33)
      expect(heap.min).to eq(33)
    end
  end

  describe '#min' do
    it 'returns the element at the root' do
      heap.insert(33)
      heap.insert(94)
      heap.insert(18)

      expect(heap.min).to eq(18)
    end
  end

  describe '#remove_min' do
    it 'removes the element at the root' do
      heap.insert(33)
      heap.insert(94)
      heap.insert(18)

      expect(heap.remove_min).to eq(18)
      expect(heap.min).to eq(33)
    end
  end

  describe '#new' do
    context 'given an array' do
      it 'creates a heap with all elements' do
        heap = described_class.new([94, 33, 48, 18, 82])
        expect(heap.min).to eq(18)
      end
    end

    context 'given multiple argument' do
      it 'creates a heap with all arguments' do
        heap = described_class.new(94, 33, 48, 18, 82)
        expect(heap.min).to eq(18)
      end
    end

    context 'given a single argument' do
      it 'creates a heap with it' do
        heap = described_class.new(48)
        expect(heap.min).to eq(48)
      end

      context 'which is nil' do
        it 'creates a heap with it' do
          heap = described_class.new(nil)
          expect(heap.min).to eq(nil)
        end
      end
    end
  end
end
