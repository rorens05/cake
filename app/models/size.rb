class Size < ApplicationRecord
  belongs_to :product

  SIZES = ['Small', 'Medium', 'Large']

  validates :label, :inclusion => { :in => SIZES }

end
