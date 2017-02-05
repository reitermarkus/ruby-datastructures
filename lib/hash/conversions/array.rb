#!/usr/bin/env ruby

# Extend Array class with a to_h method.
class Array
  unless defined?(to_h)
    def to_h
      each_with_index do |e, i|
        unless e.is_a?(Array)
          raise TypeError,
                "wrong element type #{e.class} at #{i} (expected array)"
        end

        next if e.length == 2
        raise ArgumentError,
              "wrong array length at #{i} (expected 2, was #{e.length})"
      end

      Hash[self]
    end
  end
end
