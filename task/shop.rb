require 'date'

class Shop_Order_System
  attr_reader :order

  def initialize
    @order = {}
  end

  #for first case
  def add_order(date_str, amount)
    date = Date.parse(date_str)
    @order[date] ||= []
    @order[date] << amount
  end

  #for second case
  def print_day_details(date_str)
    date = Date.parse(date_str)
    if @order[date]
      total_orders = @order[date].size
      total_amount = @order[date].sum
      min_order = @order[date].min
      max_order = @order[date].max
      avg_order =(total_amount.to_f / total_orders).round(2)

      puts "Today's Details"
      puts "-----------------"
      puts "Total Order #: #{total_orders}"
      puts "Total Amount: #{total_amount}"
      puts "Minimum Order: #{min_order}"
      puts "Maximum Order: #{max_order}"
      puts "Average Order: #{avg_order}"
      puts "======================"
    else
      puts "No order found on #{date_str}"
    end
  end

  #for third case
  def print_month_details(month, year)
    start_month_date = Date.new(year, month)
    end_month_date = start_month_date.next_month
    total_orders = 0
    total_amount = 0

    @order.each do |date, amount|
      if date >= start_month_date && date <= end_month_date
        total_orders += amount.size
        total_amount += amount.sum
      end
    end

    if total_orders > 0
      puts "Total number of order in this month is: #{total_orders}"
      puts "Total amount of this month is: $#{total_amount}"
    else
      puts "No order found in this month"
    end
  end

  def run
    puts "======================"
    puts "Welcome to My Shop"
    puts "======================"
    puts "1. Create New Order"
    puts "2. Print Day Details"
    puts "3. Print Month Details"
    loop do
      print "How may I help you?(1, 2, 3 or quit): "
      input = gets.strip
      case input
      when "1"
        print "Enter order details (date in YYYY-MM-DD and amount): "
        order_detail = gets.strip.split
        add_order(order_detail[0], order_detail[1].to_i)
        puts "Order added"
      when "2"
        print "Enter date (YYYY-MM-DD) to print day details: "
        date = gets.strip
        print_day_details(date)
      when "3"
        print "Enter month and year (MM YYYY) to print month details: "
        month_year = gets.split" "
        print_month_details(month_year[0].to_i, month_year[1].to_i)
      when "quit", "q"
        puts "Quitting..."
        break
      else
        puts "Invalid option, please try agian"
      end
    end
  end
end

shop = Shop_Order_System.new
shop.run
