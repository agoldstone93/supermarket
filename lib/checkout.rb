class Checkout
  def initialize(items)
    @items = items
    @price_list = {FR1: 3.11, SR1: 5, CF1: 11.23}
    @total = 0
  end

  # @return [String]
  def price
    add_to_total
    to_pounds(@total)
  end

private

  def add_to_total
    @items.each do |item|
      @total += @price_list[item.to_sym]
    end
  end

  # @return [String] number formatted "£X.XX"
  def to_pounds(num)
    "£#{sprintf('%.2f', num)}"
  end
end