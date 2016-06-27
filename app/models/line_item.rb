class LineItem < ActiveRecord::Base
  belongs_to :product # Связь с таблицей product => line_item.product.title
  belongs_to :cart    #Связь с таблицей cart

  def total_price
    product.price * quantity
  end

end
