class ChangeWorkoutComponentId < ActiveRecord::Migration[6.0]
  def change
    remove_column :exercises, :workoutcomponentid, :integer
    remove_column :workouts, :workoutcomponentid, :integer
  end
end
