#!/usr/bin/env ruby

# Heap
class Heap
  MINHEAP = -> (p, c) { p < c }
  MAXHEAP = -> (p, c) { p > c }

  def initialize(comp, *args)
    @comp = comp

    if args.count == 1 && args[0].is_a?(Enumerable)
      initialize_using_array args[0].to_a
    elsif args.count == 1
      @heap = [args[0]]
    else
      initialize_using_array args
    end

    self
  end

  def insert(data)
    @heap[@heap.size] = data
    bubble_up(@heap.size - 1)

    self
  end

  def root
    @heap[0]
  end

  def remove_root
    data = root

    @heap[0] = @heap.delete_at(@heap.size - 1)

    trickle_down 0

    data
  end

  private

  def initialize_using_array(array)
    @heap = array
    bottom_up_heapsort
  end

  def bubble_up(child)
    while parent?(child) && unordered?(@heap[parent(child)], @heap[child])
      parent = parent(child)
      swap(child, parent)
      child = parent
    end
  end

  def trickle_down(parent)
    while left_child? parent
      left = swapped = left_child  parent
      right          = right_child parent

      if right_child? parent
        swapped = right if unordered?(@heap[left], @heap[right])
      end

      swap(parent, swapped) if unordered?(@heap[parent], @heap[swapped])

      parent = swapped
    end
  end

  def bottom_up_heapsort
    parent(@heap.size - 1).downto(0).each do |x|
      trickle_down x
    end
  end

  def ordered?(parent, child)
    @comp.call(parent, child)
  end

  def unordered?(parent, child)
    !ordered?(parent, child)
  end

  def swap(i, j)
    @heap[i], @heap[j] = @heap[j], @heap[i]
  end

  def parent(index)
    (index - 1) / 2
  end

  def parent?(index)
    index > 0
  end

  def left_child(index)
    2 * index + 1
  end

  def right_child(index)
    2 * index + 2
  end

  def left_child?(index)
    left_child(index) < @heap.size
  end

  def right_child?(index)
    right_child(index) < @heap.size
  end
end

# MinHeap
class MinHeap < Heap
  def initialize(*args)
    super(self.class.superclass::MINHEAP, *args)
  end
  alias min root
  alias remove_min remove_root
end

# MaxHeap
class MaxHeap < Heap
  def initialize(*args)
    super(self.class.superclass::MAXHEAP, *args)
  end
  alias max root
  alias remove_max remove_root
end
