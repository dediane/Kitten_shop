class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items
end
