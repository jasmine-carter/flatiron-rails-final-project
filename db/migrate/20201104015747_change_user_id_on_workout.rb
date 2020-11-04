class ChangeUserIdOnWorkout < ActiveRecord::Migration[6.0]
  def change
    change_table :workouts do |t|
      t.rename :userid, :user_id
    end
  end
end
