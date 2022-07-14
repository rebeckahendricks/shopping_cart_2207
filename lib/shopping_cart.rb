require './lib/product.rb'

class ShoppingCart
  attr_reader :name, :capacity, :products, :details

  def initialize(name, capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []
    @details = {name: name, capacity: capacity.to_i}
  end

  def add_product(product)
    @products << product
  end

  def total_number_of_products
    quantities = []
    @products.each do |product|
      quantities << product.quantity
    end
    quantities.sum
  end

  def is_full?
    total_number_of_products > @capacity
  end

  def products_by_category(category)
    @products.find_all do |product|
    product.category == category
    end
  end

end
