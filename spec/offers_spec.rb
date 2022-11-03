require 'checkout'
require 'pry'

describe 'special offers' do
  it 'can buy two fruit teas for £3.11' do
    shopping_list = ['FR1', 'FR1']
    checkout = Checkout.new(shopping_list, true, false)
    expect(checkout.price).to eq '£3.11'
  end

  it 'can buy strawberries for £4.50 if buying 3 or more' do
    shopping_list = ['SR1', 'SR1', 'SR1']
    checkout = Checkout.new(shopping_list, false, true)
    expect(checkout.price).to eq '£13.50'
  end
end