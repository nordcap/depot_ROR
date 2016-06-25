require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products #какой из стендовых файлов загружать

  test "Свойства товара не должны быть пустыми" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "Цена товара должна быть положительной" do
    # Цена товара должна быть положительной
    product = Product.new(
        title: "Название товара",
        description: "Какое то описание товара",
        image_url: "zzz.jpg"
    )
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 1
    assert product.valid?
  end


  def new_product(image_url)
    Product.new(
        title: "Название товара",
        description: "Какое то описание товара",
        price: 1,
        image_url: image_url)
  end


  test "image url" do
    #url изображения
    ok = %w{fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif}
    bad = %w{fred.doc fred.gif/more fred.gif.more}

    ok.each do |name|
      assert new_product(name).valid?, "#{name} shouldn't be invalid "
    end

    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end

  end


  test "product is not valid without a unique title" do
    #Если у товора нет уникального названия то он недопустим
    product = Product.new(
        title: products(:notebook).title,
        description: products(:notebook).description,
        price: products(:notebook).price,
        image_url: products(:notebook).image_url
    )
    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
    #уже было использовано
  end


  test "check length in title product" do
    #если длина  названия товора меньше 10 то он недопустим
    product = Product.new(
        title: products(:one).title,
        description: products(:one).description,
        price: products(:one).price,
        image_url: products(:one).image_url
    )
    assert product.invalid?
    assert_equal ["is too short (minimum is 10 characters)"], product.errors[:title]


    product.title = products(:notebook).title
    assert product.valid?

  end

end
