require 'doubly_linked_node'

# Stack
class Stack
  attr_reader :size

  def initialize(data = nil)
    @size = 0
    @top = nil

    [*data].each(&method(:push))

    self
  end

  def push(data)
    @top = @top.nil? ? DoubleLinkedNode.new(data) : @top.insert_after(data)

    @size += 1

    self
  end

  def pop
    data = top

    @top = @top.remove.prev

    @size -= 1

    data
  end

  def top
    @top.data unless size.zero?
  end

  def empty?
    size.zero?
  end

  def to_s
    string = ''
    unless @top.nil?
      @top.reverse_each.with_index do |e, i|
        string.prepend(', ') if i > 0
        string.prepend(e.data.to_s)
      end
    end
    string.prepend('[').concat(']')
  end
  alias inspect to_s
end
