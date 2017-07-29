class Drill < ApplicationRecord
  belongs_to :drill_group, :optional => true
  has_many :answers, dependent: :destroy
end
