class Product < ApplicationRecord
  belongs_to :category
  has_many :orders, dependent: :destroy
  has_many :sizes, dependent: :destroy
  has_one_attached :image
end
