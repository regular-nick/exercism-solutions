class SimpleCalculator
  class UnsupportedOperation < StandardError; end
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    result = "#{first_operand} #{operation} #{second_operand} = "
    # Error handling
    unless first_operand.is_a?(Integer) && second_operand.is_a?(Integer)
      raise ArgumentError.new('One of arguments is of wrong type.')
    end
    return 'Division by zero is not allowed.' if second_operand.zero? && operation == '/'

    case operation
    when '+' then result + (first_operand + second_operand).to_s
    when '*' then result + (first_operand * second_operand).to_s
    when '/' then result + (first_operand / second_operand).to_s
    else
      raise UnsupportedOperation.new('Operation is not supported')
    end
  end
end
