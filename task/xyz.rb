require 'date'

class ShopOrderSystem
  attr_reader :orders

  def initialize
    @orders = {}
  end

  def add_order(date_str, amount)
    date = Date.parse(date_str)
      @orders[date] ||= []
      @orders[date] << amount
  end

  def print_day_details(date_str)
    date = Date.parse(date_str)
    if @orders[date]
      total_orders = @orders[date].size
      total_amount = @orders[date].sum
      min_order = @orders[date].min
      max_order = @orders[date].max
      avg_order = (total_amount.to_f / total_orders).round(2)

      puts "Total Order #: #{total_orders}"
      puts "Total Amount: $#{total_amount}"
      puts "Minimum Order: $#{min_order}"
      puts "Maximum Order: $#{max_order}"
      puts "Average Order: $#{avg_order}"
    else
      puts "No orders found for #{date_str}"
    end
  end

  def print_month_details(month, year)
    month_date_begin = Date.new(year, month)
    month_date_end = month_date_begin.next_month.prev_day
    total_orders = 0
    total_amount = 0

    @orders.each do |date, amounts|
      if date >= month_date_begin && date <= month_date_end
        total_orders += amounts.size
        total_amount += amounts.sum
      end
    end

    if total_orders > 0
      puts "Total orders in #{month}/#{year}: #{total_orders}"
      puts "Total amount for #{month}/#{year}: $#{total_amount}"
    else
      puts "No orders found for #{month}/#{year}"
    end
  end

  def start
    puts "======================"
    puts "Welcome to My Shop"
    puts "======================"
    puts "How may I help you?(1, 2, 3 or quit)"
    loop do
      print "Choose an option (1, 2, 3, quit): "
      input = gets.strip.downcase
      case input
      when "1"
        print "Enter order details (date in YYYY-MM-DD and amount): "
        order_details = gets.strip.split
        add_order(order_details[0], order_details[1].to_i)
        puts "Order added."
      when "2"
        print "Enter date (YYYY-MM-DD) to print day details: "
        date = gets.strip
        print_day_details(date)
      when "3"
        print "Enter month and year (MM YYYY) to print month details: "
        month_year = gets.strip.split
        print_month_details(month_year[0].to_i, month_year[1].to_i)
      when "quit", "q"
        puts "Quitting..."
        break
      else
        puts "Invalid option, please try again."
      end
    end
  end
end

# Running the program
shop = ShopOrderSystem.new
shop.start
