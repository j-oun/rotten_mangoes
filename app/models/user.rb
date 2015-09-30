class User < ActiveRecord::Base
  has_many :reviews
  has_secure_password
  mount_uploader :avatar, AvatarUploader

   def full_name
     "#{firstname} #{lastname}"
   end

end
