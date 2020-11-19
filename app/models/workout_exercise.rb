class WorkoutExercise < ApplicationRecord
  belongs_to :exercise
  belongs_to :workout

  validates :exercise_id, presence: true
  validates :reps, presence: true
  validates :sets, presence: true
  validates :sets, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100, message: "Hang on there Hercules, you must do at least 1 up to 100 sets"}
  validates :reps, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100, message: "Hang on there Hercules, you must do at least 1 up to 100 reps"}

end
