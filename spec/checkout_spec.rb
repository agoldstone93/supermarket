require 'checkout'

describe Checkout do
  it 'can return the price when no items are scanned' do
    checkout = Checkout.new([])
    expect(checkout.price).to eq '£0.00'
  end

  it 'can return the price when one fruit tea is scanned' do
    shopping_list = ['FR1']
    checkout = Checkout.new(shopping_list)
    expect(checkout.price).to eq '£3.11'
  end

  it 'can return the price when one strawberry is scanned' do
    shopping_list = ['SR1']
    checkout = Checkout.new(shopping_list)
    expect(checkout.price).to eq '£5.00'
  end

  it 'can return the price when one coffee is scanned' do
    shopping_list = ['CF1']
    checkout = Checkout.new(shopping_list)
    expect(checkout.price).to eq '£11.23'
  end

  it 'can return the price when two coffees are scanned' do
    shopping_list = ['CF1', 'CF1']
    checkout = Checkout.new(shopping_list)
    expect(checkout.price).to eq '£22.46'
  end

  it 'can return the price when three fruit teas, one straberry and one coffee is scanned' do
    shopping_list = ['FR1', 'SR1', 'CF1', 'FR1', 'FR1']
    checkout = Checkout.new(shopping_list)
    expect(checkout.price).to eq '£25.56'
  end
end
