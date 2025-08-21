class CircularBuffer

  class BufferFullException < StandardError

    def initialize(
      message =
        'The buffer is full!'
    )
      super
    end
  end

  class BufferEmptyException < StandardError
  
    def initialize(
      message =
        'The buffer is empty!'
    )
      super
    end
  end

  attr_accessor :size, 
                :buffer, 
                :reading, 
                :writing, 
                :oldest
  def initialize(size)
    self.size = size
    self.buffer = Array.new(size)
    self.reading = 0 # ? Could be self.reading_index 
    self.writing = 0
    self.oldest = nil
  end

  def wrap_move(arrow, step)
    (arrow + step) % self.size
  end

  def write(element)
    raise BufferFullException unless buffer[writing].nil?
    
    buffer[writing] = element
    self.oldest = writing if oldest.nil?
    self.writing = wrap_move(writing, 1)
  end

  def write!(element)
    if buffer[writing].nil?
      write(element)
    else
      read
      buffer[wrap_move(reading, -1)] = element
    end
  end

  def read
    raise BufferEmptyException if buffer[reading].nil?

    element = buffer[reading]
    buffer[reading] = nil
    self.reading = wrap_move(reading, 1)
    element
  end

  def clear
    self.buffer = Array.new(size)
  end

end
