class ChargesController < ApplicationController
  def new
  end
  
  def create
    # Amount in cents
    @amount = 500
  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'pack of 5 stickers',
      currency: 'usd',
    })

    # # NEXT 20 LINES WORK FOR SUBSCRIPTION.
    # @plan = Stripe::Plan.retrieve('basic')
    # unless @plan
    #   plan = Stripe::Plan.create(
    #     :name => @basic,
    #     :id => 'basic',
    #     :interval => "year",
    #     :currency => 'usd',
    #     :amount => 25,
    #   )
    # else
    #   subscription = Stripe::Subscription.create({
    #   customer: customer.id,
    #   items: [
    #     {
    #       plan: 'basic',
    #     },
    #   ],
    # })
    # end


    # basic = Stripe::Plan.retrieve(basic)
    # unless basic
    #   basic = Stripe::Plan.create({
    #     id: 'basic',
    #     amount: 25,
    #     currency: 'usd',
    #     interval: 'year',
    #     product: {name: 'basic'},
    # })
    # end

    # screen = Stripe::Plan.create({
    #   id: 'screen',
    #   amount: 75,
    #   currency: 'usd',
    #   interval: 'year',
    #   product: {name: 'screen'},
    # })

    # promote = Stripe::Plan.create({
    #   id: 'promote',
    #   amount: 99,
    #   currency: 'usd',
    #   interval: 'year',
    #   product: {name: 'promote'},
    # })
    
    
    binding.pry
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to :root
  end
end
