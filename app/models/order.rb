class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  belongs_to :size, optional: true
end
