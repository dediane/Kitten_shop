class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #User has 1-N relationship to orders
  #User has 1-1 relationship to cart
  has_one :cart
  has_many :orders

  validates :email, 
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "wrong email format" }
  validates :password, length: { in: 6..20 }, allow_blank: true

  
  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
