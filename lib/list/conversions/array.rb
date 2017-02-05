#!/usr/bin/env ruby

# Extend Array class with a to_l method.
class Array
  def to_l
    List.new(self)
  end
end
