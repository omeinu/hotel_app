class User < ApplicationRecord
    
    mount_uploader :image, ImageUploader
    
    validates :name, {presence: true, length: {maximum: 12}}
    validates :email, {uniqueness: true}
    validates :password, {presence: true}
    
end
