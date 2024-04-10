puts "Enter the first integer : "
num1 = gets.chomp.to_i

puts "Enter the second integer : "
num2 = gets.chomp.to_i

def calculator(num1 , num2)
  add = num1 + num2
  substract = num1 - num2
  multiply = num1 * num2
  divide = num1.to_f / num2.to_f

  puts "Addition : #{num1} + #{num2} = #{add}"
  puts "substraction : #{num1} - #{num2} = #{substract}"
  puts "multiplication : #{num1} * #{num2} = #{multiply}"
  puts "division : #{num1} / #{num2} = #{divide}"
end

calculator(num1 , num2)
