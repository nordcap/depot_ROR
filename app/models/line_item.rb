class LineItem < ActiveRecord::Base
  belongs_to :product # Связь с таблицей product => line_item.product.title
  belongs_to :cart    #Связь с таблицей cart
  belongs_to :order #Связь с таблицей order

  def total_price
    product.price * quantity
  end

end
