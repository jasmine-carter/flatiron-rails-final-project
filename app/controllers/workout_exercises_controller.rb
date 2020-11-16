class WorkoutExercisesController < ApplicationController

  def new
    @workout_exercise = WorkoutExercise.new(workout_id: params[:workout_id])
    @workout = Workout.find_by(id: params[:workout_id])
  end

  def create
    #add validations
    @workout_exercise = WorkoutExercise.create(workout_exercise_params)
    @workout_exercise.save
    redirect_to @workout_exercise.workout
  end

  def delete
  end

  def workout_exercise_params
    params.require(:workout_exercise).permit(:reps, :sets, :exercise_id, :workout_id)
  end


end
