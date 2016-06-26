# Stack
class Stack
  attr_reader :size

  Struct.new('StackItem', :data, :subitem) do
    def each
      return enum_for(:each) unless block_given?
      item = self
      until item.nil?
        yield item
        item = item.subitem
      end
    end
  end

  def initialize(data = nil)
    @size = 0
    @top = nil

    [*data].each(&method(:push))

    self
  end

  def push(data)
    @top = Struct::StackItem.new(data, @top)

    @size += 1

    self
  end

  def pop
    data = top

    @top = @top.subitem
    @size -= 1

    data
  end

  def top
    raise(IndexError, 'stack is empty') if empty?
    @top.data
  end

  def empty?
    size.zero?
  end

  def to_s
    string = ''
    unless @top.nil?
      @top.each.with_index do |e, i|
        string.prepend(', ') if i > 0
        string.prepend(e.data.to_s)
      end
    end
    string.prepend('[').concat(']')
  end
  alias inspect to_s
end
