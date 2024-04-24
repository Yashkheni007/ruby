puts "enter a string : "
char = gets.chomp

latter = Regexp.new(/[a-zA-Z]/)
space = Regexp.new(/\s/)
number = Regexp.new(/[0-9]/)
other_char = Regexp.new(/[^a-zA-Z0-9\s]/)

puts "latter is : #{char.scan(latter).length}"
puts "space is : #{char.scan(space).length}"
puts "number is : #{char.scan(number).length}"
puts "special character is : #{char.scan(other_char).length}"
