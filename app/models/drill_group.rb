class DrillGroup < ApplicationRecord
  has_many :drills, dependent: :destroy
end
