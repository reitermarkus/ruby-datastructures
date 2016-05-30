#!/usr/bin/env ruby

# Double Linked Node
class DoubleLinkedNode
  include Enumerable

  attr_accessor :data, :prev, :next

  def initialize(data = nil, p = nil, n = nil)
    @data = data
    @prev = p
    @next = n
    self
  end

  def insert_before(data)
    node = self.class.new(data, @prev, self)
    @prev.next = node unless @prev.nil?
    @prev = node
  end

  def insert_after(data)
    node = self.class.new(data, self, @next)
    @next.prev = node unless @next.nil?
    @next = node
  end

  def remove
    @prev.next = @next unless @prev.nil?
    @next.prev = @prev unless @next.nil?
  end

  def each(&block)
    traverse(:next, :each, &block)
  end

  def reverse_each(&block)
    traverse(:prev, :reverse_each, &block)
  end

  private

  def traverse(direction, method)
    return enum_for(method) unless block_given?
    node = self
    until node.nil?
      yield node
      node = node.public_send(direction)
    end
  end
end
