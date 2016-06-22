#!/usr/bin/env ruby

require 'test_helper'
require 'stack'

class TestStack < Test::Unit::TestCase
  def test_empty
    stack = Stack.new

    assert(stack.empty? == true)
  end

  def test_populated
    stack = Stack.new(27)

    assert(stack.empty? == false)
  end

  def test_size_empty
    stack = Stack.new

    assert_equal(stack.size, 0)
  end

  def test_length_populated
    stack = Stack.new(27)

    assert_equal(stack.size, 1)
  end

  def test_pop
    stack = Stack.new(27)

    assert_equal(stack.pop, 27)
  end

  def test_push
    stack = Stack.new

    stack.push(66)
    stack.push(31)
    stack.push(19)
    stack.push(48)

    assert_equal(stack.size, 4)
  end

  def test_pop_multiple
    stack = Stack.new

    stack.push(66)
    stack.push(31)
    stack.push(19)
    stack.push(48)

    assert_equal(stack.pop, 48)
    assert_equal(stack.pop, 19)
    assert_equal(stack.pop, 31)
    assert_equal(stack.pop, 66)
  end

  def test_top
    stack = Stack.new

    stack.push(66)
    stack.push(31)
    stack.push(19)
    stack.push(48)

    assert_equal(stack.top, 48)
    assert_equal(stack.top, 48)
    assert_equal(stack.top, 48)
    assert_equal(stack.top, 48)
  end

  def test_empty_to_s
    stack = Stack.new

    assert_equal(stack.to_s, '[]')
  end

  def test_to_s
    stack = Stack.new

    stack.push(66)
    stack.push(31)
    stack.push(19)
    stack.push(48)

    assert_equal(stack.to_s, '[66, 31, 19, 48]')
  end
end
