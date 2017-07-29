class User < ApplicationRecord
  has_many :attempted_drills
  has_secure_password
  
end
