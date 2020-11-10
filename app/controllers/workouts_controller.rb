class WorkoutsController < ApplicationController

  def index
    @workouts = Workout.all
  end

  def new
    @workout = Workout.new
    @workout.workout_exercises.build
    @workout.workout_exercises.build
    @workout.workout_exercises.build
  end

  def create
  end

  def show
  end

  def edit
  end

  def delete
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :user_id, workout_exercise_attributes: [:reps, :sets, :exercise_id])
  end

end
