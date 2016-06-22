#!/usr/bin/env ruby

require 'list/conversions'
require 'doubly_linked_node'

# Doubly Linked List
class List
  include Enumerable

  private

  attr_reader :head, :tail

  public

  attr_reader :length

  def initialize(data = nil)
    @length = 0
    @head = nil
    @tail = nil

    [*data].each(&method(:append))

    self
  end

  private

  def validate_index(index)
    if index >= @length || index < -@length
      raise IndexError,
            "index #{index} outside of list bounds: " +
            (empty? ? 'list is empty' : "#{-@length}..#{@length - 1}")
    elsif index > @length / 2
      index -= @length
    elsif index < -@length / 2
      index += @length
    end

    index
  end

  def get_node(index)
    index = validate_index(index)

    if index < 0
      index = index.abs - 1
      node = @tail.reverse_each
    else
      node = @head.each
    end

    node.next while (index -= 1) >= 0

    node.peek
  end

  def add_first_node(data)
    @head = DoubleLinkedNode.new(data)
    @tail = @head
    @length = 1
  end

  def traverse(direction, method)
    return enum_for(method) unless block_given?
    return nil if send(direction).nil?
    send(direction).public_send(method) { |node| yield node.data }
  end

  public

  def prepend(data)
    if empty?
      add_first_node(data)
    else
      @head = @head.insert_before(data)
      @length += 1
    end

    self
  end

  def insert(index, data)
    if index == 0
      prepend(data)
    elsif index < @length
      get_node(index).insert_before(data)
      @length += 1
    else
      append(nil) while index > @length
      append(data)
    end

    self
  end

  def append(data)
    if empty?
      add_first_node(data)
    else
      @tail = @tail.insert_after(data)
      @length += 1
    end

    self
  end

  def first
    get(0)
  end

  def get(index)
    get_node(index).data
  end
  alias [] get

  def last
    get(-1)
  end

  def set(index, data)
    get_node(index).data = data
  end
  alias []= set

  def delete(index)
    node = get_node(index).remove

    @head = @head.next if node == @head
    @tail = @tail.prev if node == @tail

    @length -= 1

    node.data
  end

  def empty?
    @length == 0
  end

  def each(&block)
    traverse(:head, :each, &block)
  end

  def reverse_each(&block)
    traverse(:tail, :reverse_each, &block)
  end

  def inspect
    output = '['
    each.with_index do |data, i|
      output.concat(i == 0 ? data.inspect : ', ' << data.inspect)
    end
    output.concat(']')
  end
  alias to_s inspect
end
