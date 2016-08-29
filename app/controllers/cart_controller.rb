class CartController < ApplicationController
  #before_action :authenticate_user!, except:[:index]

  def add
    id = params[:id]
# if the cart has already been created, use the existing cart else create a new cart
  	if session[:cart] then
  		cart = session[:cart]
  	else
  		session[:cart]={}
  		cart = session[:cart]
  	end

    #if the product has already added the cart, icrement the balue else set cart
  	if cart[id] && !params[:quantity] then
  		 cart[id] = cart[id] + 1
    elsif params[:quantity]
       cart[id] = params[:quantity].to_i
  	else
  		cart[id] = 1
  	end
  	redirect_to :action => :index
  end #end add method

  def clearCart
  	session[:cart]=nil
  	redirect_to :action => :index
  end

  def index
    #if there is a cart, pass it to the page for display else pass an empty value
  	if session[:cart] then
  		@cart = session[:cart]
  	else
  		@cart = {}
  	end
  end
end
