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
    #create logic that assignes @workout.user_id == current_user.id
    #create logic that only users that are logged in can create workouts
    @workout = Workout.create(workout_params)
    @workout.user_id = current_user.id
    @workout.save
    params[:workout][:workout_exercises_attributes].values.each do |we|
      we = WorkoutExercise.create(exercise_id: we["exercise_id"], workout_id: @workout.id, reps: we["reps"], sets: we["sets"])
      we.errors
      we.save
    end
    redirect_to @workout
  end

  def show
    @workout = Workout.find_by(id: params[:id])
  end

  def edit
    #only allow owner of workout to edit
  end

  def delete
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :user_id, workout_exercise_attributes: [:reps, :sets, :exercise_id])
  end

end
