#!/usr/bin/env ruby

require 'test_helper'
require 'binary_search_tree'

class TestBinarySeachTree < Test::Unit::TestCase
  def test_empty
    tree = BinarySearchTree.new

    assert_equal(tree.find(94), nil)
  end

  def test_insert
    tree = BinarySearchTree.new

    tree.insert(33, :pineapple)

    assert_equal(tree.find(33), :pineapple)
  end

  def test_find
    tree = BinarySearchTree.new

    tree.insert(94, :strawberry)
    tree.insert(33, :pineapple)
    tree.insert(48, :mango)
    tree.insert(18, :melon)
    tree.insert(82, :apple)

    assert_equal(tree.find(18), :melon)
  end

  def test_find_sorted
    tree = BinarySearchTree.new

    tree.insert(18, :melon)
    tree.insert(33, :pineapple)
    tree.insert(48, :mango)
    tree.insert(82, :apple)
    tree.insert(94, :strawberry)

    assert_equal(tree.find(82), :apple)
  end

  def test_find_reverse_sorted
    tree = BinarySearchTree.new

    tree.insert(94, :strawberry)
    tree.insert(82, :apple)
    tree.insert(48, :mango)
    tree.insert(33, :pineapple)
    tree.insert(18, :melon)

    assert_equal(tree.find(33), :pineapple)
  end

  def test_find_not_in_tree
    tree = BinarySearchTree.new

    tree.insert(94, :strawberry)
    tree.insert(33, :pineapple)
    tree.insert(48, :mango)
    tree.insert(18, :melon)
    tree.insert(82, :apple)

    assert_equal(tree.find(27), nil)
  end

  def test_enum
    tree = BinarySearchTree.new

    tree.insert(94, :strawberry)
    tree.insert(48, :mango)
    tree.insert(18, :melon)

    each = tree.each

    assert_equal(each.next, :melon)
    assert_equal(each.next, :mango)
    assert_equal(each.next, :strawberry)
  end

  def test_to_array
    tree = BinarySearchTree.new

    tree.insert(94, :strawberry)
    tree.insert(48, :mango)
    tree.insert(18, :melon)

    assert_equal(tree.to_a, [:melon, :mango, :strawberry])
  end

  def test_sort
    tree = BinarySearchTree.new

    array = (1..100).to_a.shuffle

    array.each { |x| tree.insert x, x }

    assert_equal(tree.to_a, array.sort)
  end
end
