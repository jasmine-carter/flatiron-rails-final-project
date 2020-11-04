class CreateWorkoutComponents < ActiveRecord::Migration[6.0]
  def change
    create_table :workout_components do |t|
      t.integer :workout_id
      t.integer :exercise_id
    end
  end
end
