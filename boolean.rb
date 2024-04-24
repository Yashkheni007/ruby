puts "Enter a number : "
num = gets.chomp.to_i

def is_odd(num)
  num % 2 != 0
end

puts is_odd(num)
