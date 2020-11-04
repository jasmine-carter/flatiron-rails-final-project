class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :reps
      t.integer :sets
      t.integer :workoutcomponentid
      t.integer :userid
      t.boolean :private
      t.integer :categoryid
      t.integer :musclegroupid
    end
  end
end
