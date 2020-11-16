class WorkoutExercise < ApplicationRecord
  belongs_to :exercise
  belongs_to :workout

  validates :exercise_id, presence: true
  validates :reps, presence: true
  validates :sets, presence: true
end
