class ChangeForeignKeysOnExercises < ActiveRecord::Migration[6.0]
  def change
    change_table :exercises do |t|
      t.rename :categoryid, :category_id
      t.rename :musclegroupid, :musclegroup_id
    end
  end
end
