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
    binding.pry
    @workout = Workout.create(workout_params)
    params[:workout][:workout_exercises_attributes].values.each do |we|
      we = WorkoutExercise.create(exercise_id: workoutex["exercise_id"], workout_id: @workout.id, reps: workoutex["reps"], sets: workoutex["sets"])
    we.save
    #note right now exercises do have many workouts (ie exercise.workouts works), but workout.exercises does not work
    end
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
