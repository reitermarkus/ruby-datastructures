#!/usr/bin/env ruby

# Binary Search Tree Node
class BinarySearchTreeNode
  include Enumerable

  attr_accessor :key, :value, :left, :right

  def initialize(key, value)
    @key = key
    @value = value
    @left = nil
    @right = nil
  end

  def each(&block)
    return enum_for(:each) unless block_given?
    @left.each(&block) unless @left.nil?
    yield self
    @right.each(&block) unless @right.nil?
  end

  def find(key)
    if @key == key
      @value
    elsif @left.nil? && @right.nil?
      nil
    elsif key < @key
      @left.find key
    else # key > node.key
      @right.find key
    end
  end

  def insert(key, value)
    if key < @key && @left.nil?
      @left = BinarySearchTreeNode.new(key, value)
    elsif key < @key
      @left.insert(key, value)
    elsif @right.nil?
      @right = BinarySearchTreeNode.new(key, value)
    else
      @right.insert(key, value)
    end
  end
end

# Binary Search Tree
class BinarySearchTree
  include Enumerable

  def initialize
    @root = nil
  end

  def insert(key, value)
    if @root.nil?
      @root = BinarySearchTreeNode.new(key, value)
    else
      @root.insert(key, value)
    end

    self
  end

  def find(key)
    return nil if @root.nil?
    @root.find(key)
  end

  def each
    return enum_for(:each) unless block_given?
    @root.each { |node| yield node.value }
  end
end
