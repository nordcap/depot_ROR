class Product < ActiveRecord::Base
  #валидиция
  validates :title, :description, :image_url, presence: true #проверять в каждом из полей
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true #уникальное значение
  validates :title, length: {minimum: 10}
  validates :image_url, allow_blank: true, format: {with: /\.(gif|jpg|png)\Z/, message: "URL должен указывать на изображение формата GIF, JPG, PNG"}
end
