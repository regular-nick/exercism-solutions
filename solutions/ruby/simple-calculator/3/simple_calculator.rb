# frozen_string_literal: true

class SimpleCalculator
  class UnsupportedOperation < StandardError; end
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.both_operands_integer?(first_operand, second_operand)
    first_operand.is_a?(Integer) && second_operand.is_a?(Integer)
  end

  def self.zero_division_attempt?(second_operand, operation)
    second_operand.zero? && operation == '/'
  end

  def self.calculate(first_operand, second_operand, operation)
    # Error handling
    raise ArgumentError, 'One of arguments is of wrong type.' unless both_operands_integer?(first_operand, second_operand)
    raise UnsupportedOperation, 'Operation is not supported' unless ALLOWED_OPERATIONS.include?(operation)
    return 'Division by zero is not allowed.' if zero_division_attempt?(second_operand, operation)

    result = first_operand.public_send(operation, second_operand)
    "#{first_operand} #{operation} #{second_operand} = #{result}"
  end
end
