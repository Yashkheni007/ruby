class Calculator
  attr_accessor :value1, :value2

  def initialize(value1, value2)
    @value1 = value1
    @value2 = value2
  end

  def opration
    @add = value1 + value2
    @sub = value1 - value2
    @mul = value1 * value2
    @divide = value1 / value2

    puts "Sum of two number is #{@add}"
    puts "Subtract of two number is #{@sub}"
    puts "Multiplication of two number is #{@mul}"
    puts "Division of two number is #{@divide}"
  rescue ZeroDivisionError
    puts "Error: Division by zero is not allowed"
  end
end

puts "Enter a value of x: "
value1 = gets.chomp.to_i
puts "Enter a value of y: "
value2 = gets.chomp.to_i

output = Calculator.new(value1 , value2)
output.opration
