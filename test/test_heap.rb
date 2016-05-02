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
end
