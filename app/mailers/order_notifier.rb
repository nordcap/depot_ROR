class OrderNotifier < ApplicationMailer
default from: 'Alex Budaev <alex@alebu.ru>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order

    mail to: order.mail, subject: 'Подтверждение заказа в Усратушки - Обосратушки'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
    @order = order

    mail to: order.mail, subject: 'Заказ из  Усратушки - Обосратушки отправлен'
  end
end
