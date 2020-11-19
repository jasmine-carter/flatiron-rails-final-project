class Workout < ApplicationRecord
  belongs_to :user
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises
  has_many :comments
  has_many :users, through: :comments
  has_many :categories, through: :exercises
  accepts_nested_attributes_for :workout_exercises, allow_destroy: true
  validates :name, presence: true

  def workout_user
    User.find_by(id: self.user_id).name
  end

  def self.alpha_order
    order(name: :asc)
  end

  def workout_categories
    categories = []
    self.exercises.each do |e|
      categories << e.category.name
    end
    categories.uniq
  end

  def stub_workout_exercises
    3.times{self.workout_exercises.build}
  end

  def workout_muscle_groups
    muscle_groups = []
    self.exercises.each do |e|
      muscle_groups << e.muscle_group
    end
    muscle_groups.uniq
  end

end
