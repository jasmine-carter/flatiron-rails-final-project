class WorkoutExercises < ApplicationRecord
  belongs_to :exercises
  belongs_to :workouts
end
