class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  after_create :order_user_confirm
  after_create :order_admin_confirm

  def order_user_confirm
    UserMailer.order_user_confirm(self).deliver_now
  end

  def order_admin_confirm
    AdminMailer.order_admin_confirm(self).deliver_now
  end
  
end
