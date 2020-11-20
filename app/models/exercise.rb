class Exercise < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :muscle_group
  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises
  accepts_nested_attributes_for :category, :muscle_group
  validates :name, uniqueness: true, presence: true


  def self.alpha_order
    order(name: :asc)
  end


  def distinct_workouts
    distinct_workouts = []
    self.workouts.each do |w|
      distinct_workouts << w
    end
    distinct_workouts.uniq
  end
end
