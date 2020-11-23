class Cart < ApplicationRecord
  has_one :user
  has_many :line_items
  has_many :items, through: :line_items
end
