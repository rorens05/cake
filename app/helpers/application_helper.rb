module ApplicationHelper
  def validate_image(image)
    if image.attachment
      return image
    else 
      return '/images/image_not_found.png'
    end
    
  end
  
  def format_time(time)
    if time
      return time.strftime("%b %e, %Y")
    else
      return ""
    end
  end
end
