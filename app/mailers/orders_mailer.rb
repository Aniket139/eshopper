# frozen_string_literal: true

# :nodoc
class OrdersMailer < ApplicationMailer
  default from: 'eshopper@gmail.com'

  def confirmation(order)
    @order = order
    @order_details = @order.order_products.includes(:product)
    mail(to: order.customer.email, subject: 'Order Confirmation')
  end

  def cancel(order)
    @order = order
    @order_details = @order.order_products.includes(:product)
    mail(to: order.customer.email, subject: 'Order cancelled')
  end
end
