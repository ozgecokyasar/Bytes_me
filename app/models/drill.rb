class Drill < ApplicationRecord
<<<<<<< HEAD
=======
  belongs_to :drill_group, :optional => true
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers

>>>>>>> a4a7eba20c25759ff95fdea51a308eb41151e36e
end
