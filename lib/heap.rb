#!/usr/bin/env ruby

# Heap
class Heap
  def initialize(data = nil)
    @array = []
    @size = -1

    return if data.nil?

    data.each { |e| insert e }
  end

  def insert(data)
    @array[(@size += 1)] = data

    c = @size

    while @array[parent(c)] > @array[c]
      @array[c], @array[parent(c)] = @array[parent(c)], @array[c]
      c = parent(c)
    end
  end

  def min
    @array[0]
  end

  def remove_min
    data = min

    @array[0] = @array[@size]
    @size -= 1

    p = 0

    while @array[p] > @array[smaller_child p]
      @array[p], @array[smaller_child p] = @array[smaller_child p], @array[p]
      p = smaller_child(p)
    end

    data
  end

  def parent(index)
    (index - 1).abs / 2
  end

  def left_child(index)
    2 * index + 1
  end

  def right_child(index)
    2 * index + 2
  end

  def valid_index?(index)
    index <= @size
  end

  def smaller_child(index)
    if valid_index?(right_child(index)) &&
       @array[right_child index] < @array[left_child index]
      right_child(index)
    elsif valid_index?(left_child(index))
      left_child(index)
    else
      index
    end
  end
end
