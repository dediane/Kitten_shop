class UserMailer < ApplicationMailer
  default from: 'kitenshop@yopmail.fr'
 
  def welcome_email(user)
    @user = user 
    @urlHomePage  = root_url
    @urlLogin  = new_user_session_url

    mail(to: @user.email, subject: 'Bienvenue au Kitten Shop 🐱 !') 
  end

  # DEVISE MAILER DOC : https://blog.mailtrap.io/devise-reset-password/     https://github.com/heartcombo/devise/wiki/How-To:-Use-custom-mailer
end
