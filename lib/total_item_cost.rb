require_relative '../app/models/item'
require 'byebug'

class TotalItemCost

  attr_reader :item, :quantity

  def initialize(item, quantity)
    @item = item
    @quantity = quantity
  end

  def total
    # byebug
    case item.discount_type
    when "TWO_FOR_ONE"
      two_for_one
    when "HALF_PRICE"
      half_price
    when "FOUR_FOR_THREE"
      four_for_three
    when "HALF_PRICE_RESTRICTED_TO_ONE"
      half_price_restricted_to_one
    else
      item.price * quantity
    end
  end

  private
  def two_for_one
    cost = 0
    if quantity >= 2
      cost += item.price * (quantity / 2)
    end
    cost + item.price * (quantity.remainder 2)
  end

  def half_price
    (item.price / 2) * quantity
  end

  def four_for_three
    cost = 0
    if quantity >= 4
      cost += item.price * (quantity / 4 * 3)
    end
    cost + item.price * (quantity.remainder 4)
  end

  def half_price_restricted_to_one
    cost = (item.price / 2)
    cost + (item.price) * (quantity - 1)
  end
end