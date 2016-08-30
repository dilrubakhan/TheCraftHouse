class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

   def sales
    @orderlines = Orderline.all.where(seller: current_user).order("created_at DESC")
  end

  def show

  end
  def purchases
    @orders = Order.all.where(buyer: current_user).order("created_at DESC")
  end
  # GET /orders/new
  def new
    @order = Order.new
    if session[:cart]then
  		@cart = session[:cart]
  	else
  		@cart = {}
  	end
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    @cart = JSON.parse params[:cart_order].gsub('=>', ':')
    totalprice = 0
    @cart.each do | id, quantity |
    	product = Product.find_by_id(id)
      totalprice += quantity * product.price
    end
    @order.buyer_id = current_user.id
    @order.totalprice = totalprice
    # status I is for order inserted
    @order.status = 'I'


    respond_to do |format|
      if @order.save
        @cart.each do | id, quantity |
          product = Product.find_by_id(id)
          seller = product.user
          orderline = Orderline.new()
          orderline.order_id = @order.id
          orderline.product_id = id
          orderline.quantity = quantity
          orderline.price = quantity * product.price
          orderline.seller = seller
          orderline.save
        end
        Stripe.api_key = ENV["STRIPE_API_KEY"]
        token = params[:stripeToken]
        begin
          charge = Stripe::Charge.create(
            :amount => (@order.totalprice * 100).floor,
            :currency => "eur",
            :card => token
          )
          flash[:notice] = "Thanks for Ordering"
          rescue Stripe::CardError => e
          flash[:danger] = e.message
        end

        @cart.each do | id, quantity |
        product = Product.find_by_id(id)
        price = quantity * product.price
        seller = product.user
        # transfer money from the market place to the seller
        #              transfer = Stripe::Transfer.create(
        #                :amount => (price * 95).floor,
        #                :currency => "eur",
        #                :recipient => seller.routing
        #              )
          product.quantity = product.quantity - quantity
          product.save
        end
# status S is for order SENT to the seller
        @order.status = 'S'
        @order.save

        format.html { redirect_to root_url }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:address, :city, :state)
    end
end
