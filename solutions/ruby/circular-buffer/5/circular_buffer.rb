class CircularBuffer

  class BufferFullException < StandardError
    def initialize(
      message =
        'The buffer is full! 
        Use `clear` or `write!` instead.'
    )
      super(message)
    end
  end

  class BufferEmptyException < StandardError
    def initialize(
      message =
        'The buffer is empty!
        Use `write` or `write!` instead'
    )
      super(message)
    end
  end


  attr_accessor :size

  def initialize(size)
    self.size = size
    self.buffer = Array.new(size)
    self.reading = 0 # ? Could be self.reading_index 
    self.writing = 0
  end

  def read
    raise BufferEmptyException if buffer[reading].nil?

    element = buffer[reading]
    buffer[reading] = nil
    self.reading = wrap_move(reading, 1)
    element
  end

  def write(element)
    raise BufferFullException unless buffer[writing].nil?
    
    buffer[writing] = element
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

  def clear
    self.buffer = Array.new(size)
  end

  private
  
  attr_accessor :buffer,
                :reading,
                :writing

  def wrap_move(arrow, step)
    (arrow + step) % self.size
  end
  
end
