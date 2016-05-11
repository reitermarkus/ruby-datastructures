#!/usr/bin/env ruby

class BinaryTreeNode
  attr_accessor :key, :value, :left, :right

  def initialize(key, value)
    @key = key
    @value = value
    @left = nil
    @right = nil
  end
end

class BinarySearchTree

  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(key, value)
    node = BinaryTreeNode.new(key, value)

    if @root.nil?
      @root = node
    else
      insert_node(@root, node)
    end
  end

  def insert_node(root, node)
    if node.key < root.key
      if root.left.nil?
        root.left = node
      else
        insert_node(root.left, node)
      end
    else
      if root.right.nil?
        root.right = node
      else
        insert_node(root.right, node)
      end
    end
  end

  def search_recursively(key, node = @root)
    if node.nil? || node.key == key
      node
    elsif key < node.key
      search_recursively(key, node.left)
    else # key > node.key
      search_recursively(key, node.right)
    end
  end

  def each(&block)
    return enum_for(:each) unless block_given?
    traverse_at_node(@root, &block)
  end

  def traverse_at_node(node, &block)
    return if node.nil?
    traverse_at_node(node.left, &block)
    yield node.value if block_given?
    traverse_at_node(node.right, &block)
  end
end
