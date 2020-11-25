module ApplicationHelper
    def create_cart_and_assign_to_current_user
        if current_user != nil && current_user.cart == nil
            cart = Cart.create(user_id: current_user.id)
        end
    end
end
