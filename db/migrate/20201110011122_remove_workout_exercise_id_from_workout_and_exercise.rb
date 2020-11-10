class RemoveWorkoutExerciseIdFromWorkoutAndExercise < ActiveRecord::Migration[6.0]
  def change
    remove_column :exercises, :workout_exercise_id, :integer
    remove_column :workouts, :workout_exercise_id, :integer
  end
end
