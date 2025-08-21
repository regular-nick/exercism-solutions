class CircularBuffer
  
  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end
  

  def initialize(size)
    @size = size
    @array = Array.new(@size)
    @head = 0
    @tail = 0
  end

  def wrap_move(a, step = 1)
    (a + step) % @size
  end
 
  def write(element)
    if @array[@head] != nil
      raise BufferFullException
    end
    @array[@head] = element
    @oldest = @head if @olsest == nil
    @head = wrap_move(@head)
  end

  def write!(element)
    if @array[@head] == nil
      write(element)
    else
      read()
      @array[wrap_move(@tail, -1)] = element
    end
  end
  
  def read()
    if @array[@tail] == nil
      raise BufferEmptyException
    end
    element = @array[@tail]
    @array[@tail] = nil
    @tail = wrap_move(@tail)
    element
  end

  def clear()
    @array = Array.new(@size)
  end
  
end
