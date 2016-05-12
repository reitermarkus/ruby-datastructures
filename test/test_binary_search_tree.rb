#!/usr/bin/env ruby

require 'binary_search_tree'
require 'test/unit'

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
    tree.insert(33, :pineapple)
    tree.insert(48, :mango)
    tree.insert(18, :melon)
    tree.insert(82, :apple)

    each = tree.each

    assert_equal(each.next, :melon)
    assert_equal(each.next, :pineapple)
    assert_equal(each.next, :mango)
    assert_equal(each.next, :apple)
    assert_equal(each.next, :strawberry)
  end

  def test_to_array
    tree = BinarySearchTree.new

    tree.insert(94, :strawberry)
    tree.insert(33, :pineapple)
    tree.insert(48, :mango)
    tree.insert(18, :melon)
    tree.insert(82, :apple)

    assert_equal(tree.to_a, [:melon, :pineapple, :mango, :apple, :strawberry])
  end

end
