module ApplicationHelper
    def create_cart_and_assign_to_current_user
        if current_user != nil && current_user.cart == nil
            cart = Cart.create(user_id: current_user.id)
        end    
    end
    def is_current_user_admin?
        if user_signed_in?
        current_user.is_admin?
        end
    end

end
