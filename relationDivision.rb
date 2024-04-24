n1 , n2 , n3 =gets.chomp.split.map(&:to_i)
count = 0

if n3 <= n2
  print "numbers : "
  (n1..n2).each do |num|
    if num % n3 == 0
      print "#{num} "
      count += 1
    end
  end
  puts "& Counts: #{count}"
  else
    puts "Please enter n3 <= #{n2}"
end
