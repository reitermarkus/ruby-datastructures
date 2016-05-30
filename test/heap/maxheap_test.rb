#!/usr/bin/env ruby

require 'test_helper'
require 'heap'

class TestMaxHeap < Test::Unit::TestCase
  def test_insert
    heap = MaxHeap.new

    heap.insert(33)

    assert_equal(heap.max, 33)
  end

  def test_max
    heap = MaxHeap.new

    heap.insert(33)
    heap.insert(48)
    heap.insert(18)
    heap.insert(94)
    heap.insert(82)

    assert_equal(heap.max, 94)
  end

  def test_remove_max
    heap = MaxHeap.new

    heap.insert(94)
    heap.insert(33)
    heap.insert(48)
    heap.insert(18)
    heap.insert(82)

    heap.remove_max

    assert_equal(heap.max, 82)
  end

  def test_create_from_array
    heap = MaxHeap.new([94, 33, 48, 18, 82])

    assert_equal(heap.max, 94)
  end

  def test_create_from_args
    heap = MaxHeap.new(94, 33, 48, 18, 82)

    assert_equal(heap.max, 94)
  end

  def test_create_single
    heap = MaxHeap.new(48)

    assert_equal(heap.max, 48)
  end

  def test_create_single_nil
    heap = MaxHeap.new(nil)

    assert_equal(heap.max, nil)
  end
end
