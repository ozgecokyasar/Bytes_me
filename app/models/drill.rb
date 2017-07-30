class Drill < ApplicationRecord
  belongs_to :drill_group, :optional => true
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers

end
