class WorkoutExercisesController < ApplicationController

  def new
    @workout_exercise = WorkoutExercise.new
    @workout = Workout.find_by(id: params[:workout_id])
  end

  def create
  end

  def delete
  end

end
