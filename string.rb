puts "Enter a string : "
str = gets.chomp

puts "Enter an index : "
index = gets.chomp.to_i

def character(str , index)
  if index >= 0 && index < str.length
    return str[index]
  else
    return "Index out of range"
  end
end

char = character(str , index)
puts "character at index #{index} : #{char}"
