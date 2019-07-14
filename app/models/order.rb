class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  belongs_to :size, optional: true
  
  STATUSES = ['Pending', 'Waiting of downpayment','Aproved', 'Baking', 'Shipping', 'Delivered']
  validates :status, :inclusion => { :in => STATUSES }
end
