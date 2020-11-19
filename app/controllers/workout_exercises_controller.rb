class WorkoutExercisesController < ApplicationController

  def new
    @workout_exercise = WorkoutExercise.new(workout_id: params[:workout_id])
    @workout = Workout.find_by(id: params[:workout_id])
  end

  def create
      @workout_exercise = WorkoutExercise.create(workout_exercise_params)
      @workout_exercise.save
      redirect_to @workout_exercise.workout
    end

  def destroy
    @workout_exercise = WorkoutExercise.find_by(id: params[:id].to_i)
    @workout = @workout_exercise.workout
    if current_user.id == @workout_exercise.workout.user_id
      @workout_exercise.destroy
      flash[:message] = "Workout exercise successfully deleted"
      redirect_to workout_path(@workout) and return
    else
      flash[:message] = "You can only edit workout exercises that belong to you"
      redirect_to curent_user
    end
  end

  def workout_exercise_params
    params.require(:workout_exercise).permit(:reps, :sets, :exercise_id, :workout_id)
  end


end
