class NumberProcessor
  attr_accessor :number, :result

  def initialize(number)
    @number = number
    @result = {}
    @thread = []
  end

  def calculate
    @number.each do |num|
      @thread << Thread.new(num) do |n|
        squere_root = Math.sqrt(n)
        @result[n] = squere_root
      end
    end

    @thread.each(&:join)
    print_result
  end

  def print_result
    @result.each do |num , squere_root|
      puts "Number: #{num}, Squere root: #{squere_root}"
    end
  end
end

puts "Enter numbers: "
input = gets.chomp.split.map(&:to_i)
processor = NumberProcessor.new(input)
processor.calculate
