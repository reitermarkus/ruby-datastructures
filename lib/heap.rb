#!/usr/bin/env ruby

# Heap
class Heap
  def initialize(*args)
    @array = []

    return if args.all? { |x| x == nil }

    if args.length == 1
      if args[0].kind_of? Enumerable
        args[0].each { |e| insert e }
      else
        insert args[0]
      end
    else
      args.each { |e| insert e }
    end
  end

  def insert(data)
    @array[@array.length] = data
    bubble_up(@array.length - 1)
  end

  def min
    @array[0]
  end

  def remove_min
    data = min

    @array[0] = @array.delete_at(@array.length - 1)

    trickle_down 0

    data
  end

  private

  def bubble_up(index)
    while @array[parent(index)] > @array[index]
      swap(index, parent(index))
      index = parent(index)
    end
  end

  def trickle_down(index)
    while @array[index] > @array[smaller_child index]
      swap(index, smaller_child(index))
      index = smaller_child(index)
    end
  end

  def swap(i, j)
    @array[i], @array[j] = @array[j], @array[i]
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

  def smaller_child(index)
    if right_child(index) < @array.length &&
       @array[right_child index] < @array[left_child index]
      right_child(index)
    elsif left_child(index) < @array.length
      left_child(index)
    else
      index
    end
  end
end
