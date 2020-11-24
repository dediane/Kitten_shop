class Item < ApplicationRecord
  has_many :line_items
  has_many :carts, through: :line_items
  has_many :orders, through: :line_items

  validates :title,
    presence: true,
    length: {in: 3..140, message: "Title lenght must be between 3 and 140" }
  validates :description,
    presence: true,
    length: {in: 10..1000, message: "Description lenght must be between 10 and 1000" }
  validates :price,
    presence: true,
    numericality: {greater_than: 0, message: "Price must be positive"}

end