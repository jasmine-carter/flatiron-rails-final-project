class WorkoutsController < ApplicationController
  before_action :require_login

  def index
    @workouts = Workout.all.alpha_order
  end

  def new
    @workout = Workout.new
    @workout.stub_workout_exercises
    @we = @workout.workout_exercises.build
  end

  def create
    @workout = Workout.create(workout_params)
    @workout.user_id = current_user.id
    @workout.titleize_name
    @workout.save
    @workout_exercises = params[:workout][:workout_exercises_attributes].values.each do |we|
        @we = WorkoutExercise.create(exercise_id: we["exercise_id"], workout_id: @workout.id, reps: we["reps"], sets: we["sets"])
          if !@we.save
            @workout.delete
            @workout.stub_workout_exercises
            render new_workout_path and return
          else
            redirect_to @workout and return
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
      flash[:message] = "Workout exercise successfully updated"
      redirect_to workout_path(@workout)
    else
      flash[:message] = @workout.errors.full_messages
    end
  end

  def destroy
    @workout = Workout.find(params[:id])
    if current_user.id !=@workout.user_id
      flash[:message] = "You can only delete workouts you've created"
      redirect_to @workout
    else
      @workout.destroy
      flash[:message] = "Workout deleted successfully"
      redirect_to workouts_path
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :user_id, workout_exercises_attributes: [:id, :_destroy, :reps, :sets, :exercise_id])
  end

end
