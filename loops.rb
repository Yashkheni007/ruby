array = [1 ,2, 3, 4, 5, 6 , 7, 8, 9, 10]

def sum(array)
  sum_even = 0
  sum_odd = 0

  array.each do |x|
    if x % 2 == 0
      sum_even += x
    else
      sum_odd += x
    end
  end
  return sum_even , sum_odd
end

sum_even , sum_odd = sum(array)
puts "Sum of odd numbers : #{sum_odd}"
puts "Sum of even numbers : #{sum_even}"
