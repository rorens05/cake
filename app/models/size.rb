class Size < ApplicationRecord
  belongs_to :product

  SIZES = [
      '6x4", Serves 8-10',
      '8x4", Serves 14-16', 
      '10x4", Serves 20-22', 
      '6x4, 8x4", Serves 22-26', 
      '8x4, 10x4", Serves 34-38', 
      '6x4, 8x4, 10x4", Serves 42-48'
    ]

  validates :label, :inclusion => { :in => SIZES }

end
