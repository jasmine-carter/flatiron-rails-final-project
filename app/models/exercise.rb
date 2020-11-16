class Exercise < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :muscle_group
  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises
  accepts_nested_attributes_for :category, :muscle_group
  validates :name, uniqueness: true, presence: true

end
