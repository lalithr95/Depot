require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test "product attributes must not be empty" do
  	product  = Product.new
  	assert product.invalid?
  	assert product.errors[:title].any?
  	assert product.errors[:description].any?
  	assert product.errors[:image_url].any?
  	assert product.errors[:price].any?
  end

  test "product price must be positive" do
  	product  = Product.new(title: 'My app',
  		description: 'My description',
  		image_url: 'ruby.png')
  	product.price = -1
  	assert product.invalid?
  	assert_equal ["must be greater than or equal to 0.01"], product.errors['price']

  	product.price = 0
  	assert product.invalid?
  	assert_equal ["must be greater than or equal to 0.01"], product.errors['price']

  	product.price = 1
  	assert product.valid?
  end

  def product_new image_url
  	product  = Product.new(title: 'My app',
  		description: 'My description',
  		image_url: image_url,
  		price: 12.1)
  end

  test "image url" do
  	ok = %w{test.png test.jpg test.gif http://abc.xyz/hello.png}
  	bad = %w{test.png.more test.png.php}
  	ok.each do |name|
  		assert product_new(name).valid?, "#{name} should be valid"
  	end
  	bad.each do |name|
  		assert product_new(name).invalid?, "#{name} is invalid"
  	end
  end

  test "product is not valid without a unique title" do
  	product = Product.new(title: products(:ruby).title,
  		description: "xxx",
  		price: 12.3,
  		image_url: "hello.png")
  	assert product.invalid?
  	assert_equal ["has already been taken"], product.errors[:title]
  end
end
