
require_relative '../app/models/item'
require 'total_item_cost'

# This class is to handle checkout and apply discounts
class Checkout

  def scan(item)
    # when having active record we could replace the key here from name to ID
    basket << { item.name.to_sym => item }
  end

  def total
    total = 0

    basket.inject(Hash.new(0)) { |items, item| items[item] += 1; items }.each do |item, count|
      item = item.values[0]
      total += TotalItemCost.new(item, count).total
    end

    total
  end

  private

  def basket
    @basket ||= Array.new
  end
end
