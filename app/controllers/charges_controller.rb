class ChargesController < ApplicationController

  def create
    item = Item.find(params[:id])
    if item.nil?
      redirect_to items_path
      return
    end

    @session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
                         name: item.name,
                         amount: item.price,
                         currency: 'usd',
                         quantity: 1
                    }],
        success_url: charge_success_url + '?session_id={CHECKOUT_SESSION_ID}',
        cancel_url: charge_cancel_url
    )
    respond_to do |format|
      format.js
    end
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel

  end

end
