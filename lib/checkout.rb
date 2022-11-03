require 'pry'

class Checkout
  def initialize(items, bogof=false, multibuy_discount=false)
    @items = items
    @price_list = {FR1: 3.11, SR1: 5, CF1: 11.23}
    @total = 0
    @bogof = bogof
    @multibuy_discount = multibuy_discount
  end

  # @return [String]
  def price
    sum_price
    to_pounds(@total)
  end
  
  def strawbs_discount
    @price_list[:SR1] = 4.5 if @items.count('SR1') >= 3
  end
private
  
  # @return [String] items paid for when others are free
  def buy_one_get_one_free(items)
    num = 0
    items.reject do |item|
      num+=1 if item == 'FR1'
      item == 'FR1' && num%2 == 0
    end
  end


  def sum_price
    items = @items
    items = buy_one_get_one_free(items) if @bogof
    strawbs_discount if @multibuy_discount
    items.each do |item|
      @total += @price_list[item.to_sym]
    end
  end

  # @return [String] total price formatted "£X.XX"
  def to_pounds(num)
    "£#{sprintf('%.2f', num)}"
  end
end