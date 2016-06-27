class Cart < ActiveRecord::Base
  #связь с таблицей line_items с каскадным удалением => cart.line_items.count
  has_many :line_items, dependent: :destroy
end
