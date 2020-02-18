class Menu < ApplicationRecord
  has_one_attached :image

  validates :menu_name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :image, presence: true
end
