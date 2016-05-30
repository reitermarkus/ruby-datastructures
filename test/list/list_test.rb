#!/usr/bin/env ruby

require 'test_helper'
require 'list'

class TestList < Test::Unit::TestCase
  def test_empty
    list = List.new

    assert(list.empty? == true)
  end

  def test_populated
    list = List.new(27)

    assert(list.empty? == false)
  end

  def test_length_empty
    list = List.new

    assert_equal(list.length, 0)
  end

  def test_length_populated
    list = List.new(27)

    assert_equal(list.length, 1)
  end

  def test_get
    list = List.new(27)

    assert_equal(list.get(0), 27)
  end

  def test_append
    list = List.new

    list.append(66)
    list.append(31)
    list.append(19)
    list.append(48)

    assert_equal(list.get(0), 66)
    assert_equal(list.get(1), 31)
    assert_equal(list.get(2), 19)
    assert_equal(list.get(3), 48)
  end

  def test_prepend
    list = List.new

    list.prepend(66)
    list.prepend(31)
    list.prepend(19)
    list.prepend(48)

    assert_equal(list.get(0), 48)
    assert_equal(list.get(1), 19)
    assert_equal(list.get(2), 31)
    assert_equal(list.get(3), 66)
  end

  def test_insert
    list = List.new

    list.insert(0, 66)
    list.insert(1, 31)
    list.insert(2, 19)
    list.insert(2, 48)

    assert_equal(list.get(0), 66)
    assert_equal(list.get(1), 31)
    assert_equal(list.get(2), 48)
    assert_equal(list.get(3), 19)
  end

  def test_insert_with_padding_nils
    list = List.new

    list.insert(3, 66)

    assert_equal(list.length, 4)
    assert_equal(list.get(0), nil)
    assert_equal(list.get(1), nil)
    assert_equal(list.get(2), nil)
    assert_equal(list.get(3), 66)
  end

  def test_first_last
    list = List.new(27)

    assert_equal(list.first, list.last)
  end

  def test_first
    list = List.new

    list.prepend(66)
    list.prepend(31)
    list.prepend(19)
    list.prepend(48)

    assert_equal(list.first, 48)
  end

  def test_last
    list = List.new

    list.append(66)
    list.append(31)
    list.append(19)
    list.append(48)

    assert_equal(list.last, 48)
  end

  def test_set
    list = List.new

    list.insert(0, 66)
    list.insert(1, 31)
    list.insert(2, 19)
    list.insert(3, 48)

    list.set(1, 92)

    assert_equal(list.get(1), 92)
  end

  def test_get_negative
    list = List.new

    list.append(66)
    list.append(31)
    list.append(19)
    list.append(48)

    assert_equal(list.get(-3), 31)
  end

  def test_delete_first
    list = List.new

    list.append(66)
    list.append(31)
    list.append(19)
    list.append(48)

    deleted = list.delete(0)

    assert_equal(deleted, 66)
    assert_equal(list.get(0), 31)
  end

  def test_delete
    list = List.new

    list.append(66)
    list.append(31)
    list.append(19)
    list.append(48)

    deleted = list.delete(1)

    assert_equal(deleted, 31)
    assert_equal(list.get(1), 19)
  end

  def test_delete_last
    list = List.new

    list.append(66)
    list.append(31)
    list.append(19)
    list.append(48)

    deleted = list.delete(3)

    assert_equal(deleted, 48)
    assert_raise IndexError do
      list.get(3)
    end
  end

  def test_each
    list = List.new

    list.append(66)
    list.append(31)
    list.append(19)
    list.append(48)

    each = list.each

    assert_equal(each.next, 66)
    assert_equal(each.next, 31)
    assert_equal(each.next, 19)
    assert_equal(each.next, 48)
  end

  def test_reverse_each
    list = List.new

    list.append(66)
    list.append(31)
    list.append(19)
    list.append(48)

    reverse_each = list.reverse_each

    assert_equal(reverse_each.next, 48)
    assert_equal(reverse_each.next, 19)
    assert_equal(reverse_each.next, 31)
    assert_equal(reverse_each.next, 66)
  end

  def test_empty_to_a
    list = List.new

    assert_equal(list.to_a, [])
  end

  def test_to_a
    list = List.new

    list.append(66)
    list.append(31)
    list.append(19)
    list.append(48)

    assert_equal(list.to_a, [66, 31, 19, 48])
  end

  def test_empty_to_s
    list = List.new

    assert_equal(list.to_s, '[]')
  end

  def test_to_s
    list = List.new

    list.append(66)
    list.append(31)
    list.append(19)
    list.append(48)

    assert_equal(list.to_s, '[66, 31, 19, 48]')
  end

  def test_empty_array_to_list
    array = []
    list = array.to_l

    assert_equal(array.class, Array)
    assert_equal(list.class,  List)
  end

  def test_array_to_list
    array = [0, 1, 2, 3]
    list  = array.to_l

    assert_equal(array.class, Array)
    assert_equal(list.class,  List)
  end
end
