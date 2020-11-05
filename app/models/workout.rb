class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercises, through: :workout_exercises
  has_many :comments
  has_many :users, through: :comments
  has_many :categories, through: :exercises

end
