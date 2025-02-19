require './lib/shopping_cart.rb'

describe ShoppingCart do
  it 'is an instance of ShoppingCart class' do
    cart = ShoppingCart.new("King Soopers", "30items")

    expect(cart).to be_instance_of(ShoppingCart)
  end

  it 'has a name' do
    cart = ShoppingCart.new("King Soopers", "30items")

    expect(cart.name).to eq("King Soopers")
  end

  it 'has a capacity' do
    cart = ShoppingCart.new("King Soopers", "30items")

    expect(cart.capacity).to eq(30)
  end

  it 'lists its products as an array' do
    cart = ShoppingCart.new("King Soopers", "30items")

    expect(cart.products).to eq([])
  end

  it 'can add products' do
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')

    cart.add_product(product1)
    cart.add_product(product2)

    expect(cart.products).to eq([product1, product2])
  end

  it 'can report details' do
    cart = ShoppingCart.new("King Soopers", "30items")

    expect(cart.details).to eq({name: "King Soopers", capacity: 30})
  end

  it 'can count the total number of products' do
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    expect(cart.total_number_of_products).to eq(13)
  end

  it 'can determine if it is full' do
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    expect(cart.is_full?).to eq(false)

    cart.add_product(product4)

    expect(cart.is_full?).to eq(true)
  end

  it 'can list products by category' do
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    cart.add_product(product4)

    expect(cart.products_by_category(:paper)).to eq([product1, product3])
  end

  it 'can calculate the percentage of cart occupied' do
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    expect(cart.percentage_occupied).to eq(43.33)
  end

  it 'can sort products by quantity' do
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    cart.add_product(product4)

    expect(cart.sorted_product_by_quantity).to eq([product4, product1, product2, product3])
  end

  it 'can give a breakdown of products' do
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    cart.add_product(product4)

    expect(cart.product_breakdown).to eq({meat: [product2], paper: [product1, product3], product: [product4]})
  end

end
