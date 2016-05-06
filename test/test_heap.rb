#!/usr/bin/env ruby

require 'heap'
require 'test/unit'

class TestHeap < Test::Unit::TestCase
  def test_insert
    heap = Heap.new

    heap.insert(33)

    assert_equal(heap.min, 33)
  end

  def test_min
    heap = Heap.new

    heap.insert(94)
    heap.insert(33)
    heap.insert(48)
    heap.insert(18)
    heap.insert(82)

    assert_equal(heap.min, 18)
  end

  def test_remove_min
    heap = Heap.new

    heap.insert(94)
    heap.insert(33)
    heap.insert(48)
    heap.insert(18)
    heap.insert(82)

    heap.remove_min

    assert_equal(heap.min, 33)
  end

  def test_create_from_array
    heap = Heap.new([94, 33, 48, 18, 82])

    assert_equal(heap.min, 18)
  end

  def test_create_from_args
    heap = Heap.new(94, 33, 48, 18, 82)

    assert_equal(heap.min, 18)
  end

  def test_create_single
    heap = Heap.new(48)

    assert_equal(heap.min, 48)
  end

  def test_create_single_nil
    heap = Heap.new(nil)

    assert_equal(heap.min, nil)
  end
end
