class Product < ActiveRecord::Base
  #валидиция
  validates :title, :description, :image_url, presence: true #проверять в каждом из полей
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true #уникальное значение
  validates :title, length: {minimum: 10}
  validates :image_url, allow_blank: true, format: {with: /\.(gif|jpg|png)\Z/, message: "URL должен указывать на изображение формата GIF, JPG, PNG"}

  #связи
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item #подключаемый метод вызывается перед попыткой удалить строку в БД. Если возвр. false строка не будет удалена.

  def self.latest
    Product.order(:updated_at).last
  end


  private

  #убеждаемся в отсутствии товарных позиций, ссылающихся на данный товар
  def ensure_not_referenced_by_any_line_item
     # попробовать перед line_items поставить self.    По логике нельзя просто указывать имя табл, ведь связь идет через текущий объект
    if line_items.empty?
      return true
    else
      errors.add(:base, 'существуют товарные позиции') #есть прямой доступ к errors Это место где validates() хранит сообщение об ошибках
      return false
    end
  end

end
