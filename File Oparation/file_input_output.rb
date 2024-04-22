class Word_Counter
  attr_accessor :file_path, :file_content, :word_counter

  def initialize(file_path)
    @file_path = file_path
    @file_content = ""
    @word_counter = {}
  end

  def read_file
    File.open(file_path , 'r') do |file|
      @file_content = file.read
      puts file_content
    end
  end

  def count_word
    @words = file_content.split" "

    @words.each do |word|
      @word_counter[word] ||= 0
      @word_counter[word] += 1
    end

    @total_words = @words.count
    puts "Total words: #{@total_words}"
  end

  def count_unique_word
    @word_counter.each do |word , count|
      puts "#{word} = #{count}"
    end
  end
end

file_path = "input.txt"
counter = Word_Counter.new(file_path)
counter.read_file
counter.count_word
counter.count_unique_word
