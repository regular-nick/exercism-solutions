##
# This class represents a circular buffer of arbitrary size.
# It uses an array to store elements and two pointers (@head and @tail) to keep track of the oldest and newest elements.
# When the buffer is full, trying to write a new element will raise a BufferFullException.
# When the buffer is empty, trying to read an element will raise a BufferEmptyException.
class CircularBuffer

  ##
  # This exception is raised when trying to write to a full buffer.
  class BufferFullException < StandardError
    'You attempted to write to a full buffer! Try force writing `write!` to 
    overwrite the oldest member of the buffer. Or try clearing it first by using
    `clear` method.'
  end

  ##
  # This exception is raised when trying to read from an empty buffer.
  class BufferEmptyException < StandardError
    'You attempted to read an empty buffer! Try adding something to it first by
    using `write` method.'
  end

  attr_accessor :size, :array, :head, :tail, :oldest
  ##
  # Initializes a new CircularBuffer with a given size.
  #
  # @param size [Integer] The size of the buffer.
  def initialize(size)
    self.size = size
    self.array = Array.new(size)
    self.head = 0
    self.tail = 0
    self.oldest = nil
  end

  ##
  # :nodoc:
  def wrap_move(arrow, step)
    (arrow + step) % @size
  end

  ##
  # Writes an element to the buffer at the current head position.
  #
  # @param element [Object] The element to write.
  # @raise [BufferFullException] If the buffer is already full.
  def write(element)
    raise BufferFullException unless array[head].nil?
    
    array[head] = element
    self.oldest = head if oldest.nil?
    self.head = wrap_move(head, 1)
  end

  ##
  # Forces an element to be written to the buffer, overwriting the oldest element if the buffer is full.
  #
  # @param element [Object] The element to write.
  def write!(element)
    if array[head].nil?
      write(element)
    else
      read
      array[wrap_move(tail, -1)] = element
    end
  end

  ##
  # Reads an element from the buffer at the current tail position.
  #
  # @return [Object] The read element.
  # @raise [BufferEmptyException] If the buffer is empty.
  def read
    raise BufferEmptyException if array[tail].nil?

    element = array[tail]
    array[tail] = nil
    self.tail = wrap_move(tail, 1)
    element
  end

  ##
  # Clears the buffer by resetting it to its initial state.
  def clear
    self.array = Array.new(size)
  end

end
