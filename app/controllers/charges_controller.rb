class ChargesController < ApplicationController
  def new
  end
  
  def create
    # Amount in cents
    @amount = params[:total].to_i 
    
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })

    # if a charge is created then we create an order where we add all the items and remove them from the carts
    if charge
      @order = Order.create(user_id: params[:user_id])
      @line_item = LineItem.where(cart_id: params[:cart_id])
      @line_item.each do |line|
        line.order_id = @order.id
        line.cart_id = nil
        line.save
      end
      redirect_to user_order_path(id: @order.id)
    end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end


end
