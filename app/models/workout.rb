class Workout < ApplicationRecord
  belongs_to :user
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises
  has_many :comments
  has_many :users, through: :comments
  has_many :categories, through: :exercises
  accepts_nested_attributes_for :workout_exercises


  def workout_user
    User.find_by(id: self.user_id).name
  end

end
