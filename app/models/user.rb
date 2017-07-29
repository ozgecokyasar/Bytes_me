class User < ApplicationRecord
  has_many :attempted_drills


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX



  validates :first_name, :last_name, presence: true


  validates :username, presence: true


  def full_name
  "#{first_name} #{last_name}".titleize.strip
  end


end
