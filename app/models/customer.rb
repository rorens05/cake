class Customer < ApplicationRecord
  has_one_attached :image
  has_secure_password

  STATUSES = ['Pending', 'Confirmed']
  validates :status, :inclusion => { :in => STATUSES }

  GENDERS = ['Male', 'Female']
  validates :gender, :inclusion => { :in => GENDERS }

  validates :email, uniqueness: true

  attr_accessor :image_json
  
  def save_image
    filename = "signature" + Time.current.to_i.to_s
    base64_image = image_json.sub(/^data:.*,/, '')

    decoded_image = Base64.decode64(base64_image)    

    File.open(filename + ".png", 'wb') do |f|
      f.write(Base64.decode64(base64_image))
    end
    self.image.attach(io: File.open(filename + ".png"), filename: filename + ".png", content_type: "image/png")
  end
  
end
