class AddWorkoutExercisesToWorkouts < ActiveRecord::Migration[6.0]
  def change
    add_column :workouts, :workout_exercise_id, :integer
    add_column :exercises, :workout_exercise_id, :integer
  end
end
