class CircularBuffer

  class BufferFullException < StandardError
    def initialize(
      message = %Q(
The buffer is full! Use `clear` or `write!` instead.
      )
    )
      super
    end
  end

  class BufferEmptyException < StandardError
    def initialize(
      message = %Q(
The buffer is empty! Use 'write' or 'write!' instead
      )
    )
      super
    end
  end

  
  private

  attr_accessor :buffer,
                :reading_index,
                :writing_index
  attr_writer   :size

  def initialize(size)
    self.size = size
    self.buffer = Array.new(size)
    self.reading_index = 0 # ? Could be self.reading_index
    self.writing_index = 0
  end

  def wrap_move(index, step)
    (index + step) % self.size
  end

  public
  attr_reader   :size

  def read
    raise BufferEmptyException if buffer[reading_index].nil?

    element = buffer[reading_index]
    buffer[reading_index] = nil
    self.reading_index = wrap_move(reading_index, 1)
    element
  end

  def write(element)
    raise BufferFullException unless buffer[writing_index].nil?

    buffer[writing_index] = element
    self.writing_index = wrap_move(writing_index, 1)
  end

  def write!(element)
    if buffer[writing_index].nil?
      write(element)
    else
      read
      buffer[wrap_move(reading_index, -1)] = element
    end
  end

  def clear
    self.buffer = Array.new(size)
  end
end
