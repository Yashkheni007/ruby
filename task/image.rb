puts "-------- Enter length value:"
@length = gets.chomp.to_i

if @length < 0 || @length >=10000
  puts "Invalid dimention constraints"
  exit
end

puts "-------- Enter number of image value:"
@number_of_image = gets.chomp.to_i

if @number_of_image < 0 || @number_of_image >=100
  puts "Invalid @number_of_imageo of Images"
  exit
end

@number_of_image.times do
  puts "-------- Enter diemeters value in form of width height:"
  puts "-------- Example 250 250"
  diemeters = gets.chomp.split.map(&:to_i)
  width , height = diemeters[0], diemeters[1]

  if width < 0 || width >= 10000 || height < 0 || height >= 10000
    puts "Invalid image dimensions"
    next
  end

  if width < @length || height < @length
    puts "Image not Valid"
  elsif width == height
    puts "Perfect"
  else
    puts "Crop and Accept"
  end
end
