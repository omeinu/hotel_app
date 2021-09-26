module ApplicationHelper
    
    def room_display(room)
      if room.image?
        image_tag room.image.url
      else
        image_tag "/assets/default.jpg"
      end
    end
    
    def user_display(user)
      if user.image?
        image_tag user.image.url
      else
        image_tag "/assets/default_user.jpg"
      end
    end
    
end
