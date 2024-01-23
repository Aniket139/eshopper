class OrderMailer < ActionMailer::Base
  default from: 'eshopper@gmail.com'
      
  def receipt(order)
    @order = order
    mail(to: order.user.email, subject: 'Order receipt')
  end
  
  def confirmation(order, record, token, opts = {})
    @order = order
    @token = token
    @resource = record
    mail(to: order.user.email, subject: 'Your order confirmation')
  end
end
  