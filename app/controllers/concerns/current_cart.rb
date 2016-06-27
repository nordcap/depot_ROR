#Метод set_cart выносим в отдельное место для использование метода между контролерами и
module CurrentCart
  #добавление методов другого модуля
  extend ActiveSupport::Concern

  private
  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound #обрабатываем исключение
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end