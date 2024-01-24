class OrderMailer < ActionMailer::Base
  default from: 'eshopper@gmail.com'
      
  def confirmation(id)
    @order = order
    mail(to: order.user.email, subject: 'Order Confirmation')
  end
  
  def cancel_order(id)
    @order = order
    mail(to: order.user.email, subject: 'Order cancelled')
  end
end
  