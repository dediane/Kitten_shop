class Item < ApplicationRecord
  has_many :line_items
  has_many :carts, through: :line_items
  has_many :orders, through: :line_items
  has_one_attached :picture
  after_commit :add_default_picture, on: %i[create update]

  validates :title,
    presence: true,
    length: {in: 3..140, message: "Title lenght must be between 3 and 140" }
  validates :description,
    presence: true,
    length: {in: 10..1000, message: "Description lenght must be between 10 and 1000" }
  validates :price,
    presence: true,
    numericality: {greater_than: 0, message: "Price must be positive"}


  def picture_thumbnail
    picture.variant(resize: "65x43!").processed if picture.attached?
  end

  def picture_medium
    picture.variant(resize: "288x200!").processed if picture.attached?
  end

  def picture_big
    picture.variant(resize: "525x350!").processed if picture.attached?
  end

  private

  def add_default_picture
    unless picture.attached?
      picture.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'default_kitten.jpg' 
          )
        ), filename: 'default_kitten.jpg',
        content_type: 'image/jpg'
      )
    end
  end
end