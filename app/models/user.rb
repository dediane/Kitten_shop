class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #User has 1-N relationship to orders
  #User has 1-1 relationship to cart
  has_one :cart
  has_many :orders


end
