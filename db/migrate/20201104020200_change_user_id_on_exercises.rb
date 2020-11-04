class ChangeUserIdOnExercises < ActiveRecord::Migration[6.0]
  def change
    change_table :exercises do |t|
      t.rename :userid, :user_id
    end
  end
end
