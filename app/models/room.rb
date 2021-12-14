class Room < ApplicationRecord
    
    mount_uploader :image, ImageUploader
    
    validates :name, {presence: true, length: {maximum: 12}}
    validates :introduction, {presence: true, length: {maximum: 100}}
    validates :address, {presence: true}
    validates :price, {numericality: true}
    
end
