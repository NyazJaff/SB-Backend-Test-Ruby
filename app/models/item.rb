
class Item

  attr_reader :name, :price, :discount_type

  def initialize(name:, price:, discount_type: '')
    @name = name
    @price = price
    @discount_type = discount_type
  end

  def save!
  end
end
