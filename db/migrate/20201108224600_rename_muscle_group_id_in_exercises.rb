class RenameMuscleGroupIdInExercises < ActiveRecord::Migration[6.0]
  def change
    change_table :exercises do |t|
      t.rename :musclegroup_id, :muscle_group_id
    end
  end
end
