
class Item

  attr_reader :name, :price

  def initialize(name:, price:)
    @name = name
    @price = price
  end

  def save!
  end
end