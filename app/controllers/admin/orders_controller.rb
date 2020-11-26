class Admin::OrdersController < ApplicationController
    before_action :check_if_admin?
    helper_method :check_if_admin?
    

    def index
        @orders = Order.all
        @items = Item.all
        @users = User.all
    end

    def check_if_admin?
        redirect_to root_path unless current_user.is_admin?
    end
end