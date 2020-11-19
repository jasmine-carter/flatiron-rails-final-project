class WorkoutsController < ApplicationController
  before_action :require_login

  def index
    @workouts = Workout.all.alpha_order
  end

  def new
    @workout = Workout.new
    @workout.workout_exercises.build
    @workout.workout_exercises.build
    @workout.workout_exercises.build
    @we = @workout.workout_exercises.build
  end

  def create
    @workout = Workout.create(workout_params)
    @workout.user_id = current_user.id
    @workout.save
    @workout_exercises = params[:workout][:workout_exercises_attributes].values.each do |we|
        @we = WorkoutExercise.create(exercise_id: we["exercise_id"], workout_id: @workout.id, reps: we["reps"], sets: we["sets"])
          if !@we.save
            binding.pry
            @workout.delete
            @workout.workout_exercises.build
            @workout.workout_exercises.build
            @workout.workout_exercises.build
            render new_workout_path and return
          end
        end
    end

  def show
    @workout = Workout.find_by(id: params[:id])
  end

  def edit
    @workout = Workout.find_by(id: params[:id])
    if current_user.id != @workout.user_id
      flash[:message] = "You can only edit workouts you've created"
      redirect_to workouts_path
    end
  end

  def update
    @workout = Workout.find_by(id: params[:id])
    if @workout.update(workout_params)
      redirect_to workout_path(@workout)
    else
      flash[:message] = @workout.errors.full_messages
    end
  end

  def delete

  end

  private

  def workout_params
    params.require(:workout).permit(:name, :user_id, workout_exercise_attributes: [:reps, :sets, :exercise_id])
  end

end
