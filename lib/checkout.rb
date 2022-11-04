require 'pry'

class Checkout
  def initialize(items, price_list, bogof=nil, multibuy_discount=nil)
    @items = items
    @price_list = price_list
    @total = 0
    @bogof = bogof
    @multibuy_discount = multibuy_discount
  end

  # @return [String]
  def price
    sum_price
    to_pounds(@total)
  end
  
private
  
  # @return [String] items paid for when others are free
  def buy_one_get_one_free(items, discounted_item)
    num = 0
    items.reject do |item|
      num+=1 if item == discounted_item
      item == discounted_item && num%2 == 0
    end
  end

  def discount_multiple_products(discount_details)
    @price_list[discount_details[0].to_sym] = discount_details[1] if @items.count(discount_details[0]) >= discount_details[2]
  end

  # find the total price for all items scanned and apply discounts
  def sum_price
    items = @items
    items = buy_one_get_one_free(items, @bogof) unless @bogof.nil?
    discount_multiple_products(@multibuy_discount) unless @multibuy_discount.nil?
    items.each do |item|
      @total += @price_list[item.to_sym]
    end
  end

  # @return [String] total price formatted "£X.XX"
  def to_pounds(num)
    "£#{sprintf('%.2f', num)}"
  end
end