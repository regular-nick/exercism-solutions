# frozen_string_literal: true

class SimpleCalculator
  class UnsupportedOperation < StandardError; end
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.both_operands_integer?(first_operand, second_operand)
    if first_operand.is_a?(Integer) && second_operand.is_a?(Integer)
      true
    else
      false
    end
  end

  def self.zero_division_attempt?(second_operand, operation)
    if second_operand.zero? && operation == '/'
      true
    else
      false
    end
  end

  def self.calculate(first_operand, second_operand, operation)
    result = "#{first_operand} #{operation} #{second_operand} = "
    # Error handling
    raise ArgumentError, 'One of arguments is of wrong type.' unless both_operands_integer?(first_operand, second_operand)
    return 'Division by zero is not allowed.' if zero_division_attempt?(second_operand, operation)

    case operation
    when '+' then result + (first_operand + second_operand).to_s
    when '*' then result + (first_operand * second_operand).to_s
    when '/' then result + (first_operand / second_operand).to_s
    else
      raise UnsupportedOperation, 'Operation is not supported'
    end
  end
end
