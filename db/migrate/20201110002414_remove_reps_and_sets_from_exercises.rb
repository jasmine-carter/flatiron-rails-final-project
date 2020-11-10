class RemoveRepsAndSetsFromExercises < ActiveRecord::Migration[6.0]
  def change
    remove_column :exercises, :reps, :integer
    remove_column :exercises, :sets, :integer
  end
end
