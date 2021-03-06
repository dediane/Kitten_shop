class UserMailer < ApplicationMailer
  default from: 'kitenshop@yopmail.fr'
 
  def welcome_email(user)
    @user = user 
    @urlHomePage  = root_url
    @urlLogin  = new_user_session_url

    mail(to: @user.email, subject: 'Bienvenue au Kitten Shop 🐱 !') 
  end

  def order_user_confirm(order)
    @user = order.user 
    @order = order
    @cart = order.user.cart
    @urlHomePage  = root_url
    @urlLogin  = new_user_session_url

    mail(to: @user.email, subject: 'Félicitation pour ta novelle commande 🐱 !') 
  end

  # DEVISE MAILER DOC : https://blog.mailtrap.io/devise-reset-password/     https://github.com/heartcombo/devise/wiki/How-To:-Use-custom-mailer
end
