require 'checkout'
require 'pry'

describe 'special offers' do
  it 'can buy two fruit teas for £3.11' do
    shopping_list = ['FR1', 'FR1']
    price_list = {FR1: 3.11, SR1: 5, CF1: 11.23}
    checkout = Checkout.new(shopping_list, price_list, 'FR1')
    expect(checkout.price).to eq '£3.11'
  end

  it 'can buy strawberries for £4.50 if buying 3 or more' do
    shopping_list = ['SR1', 'SR1', 'SR1']
    price_list = {FR1: 3.11, SR1: 5, CF1: 11.23}
    checkout = Checkout.new(shopping_list, price_list, nil, 'SR1')
    expect(checkout.price).to eq '£13.50'
  end
end