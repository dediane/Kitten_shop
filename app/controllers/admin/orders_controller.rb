class Admin::OrdersController < ApplicationController
  
    def index
        @orders = Order.all
        @items = Item.all
        @users = User.all
    end
end