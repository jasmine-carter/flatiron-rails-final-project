class Exercise < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :workouts, through: :workout_exercises

end
