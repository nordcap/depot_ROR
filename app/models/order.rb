class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy #каскадное удаление связи


  PAYMENT_TYPES = ["Чек", "Кредитная карта", "Заказ на покупку"]

  validates :name, :address, :email, presence: true #определенные атрибуты не пустые
  validates :pay_type, inclusion: PAYMENT_TYPES #валидацию значений атрибутов на включение в указанный набор


  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end



end
