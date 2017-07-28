class Drill < ApplicationRecord
  belongs_to :drill_group
  has_many :answers
end
