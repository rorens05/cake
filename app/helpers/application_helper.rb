module ApplicationHelper
  def validate_image(image)
    if image.attachment
      return image
    else 
      return '/images/image_not_found.png'
    end
    
  end
  
end
