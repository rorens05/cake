class Customer < ApplicationRecord
  has_one_attached :image
  has_secure_password

  STATUSES = ['Pending', 'Confirmed']
  validates :status, :inclusion => { :in => STATUSES }

  GENDERS = ['Male', 'Female']
  validates :gender, :inclusion => { :in => GENDERS }

  validates :email, uniqueness: true

end
