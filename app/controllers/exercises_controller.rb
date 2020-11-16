class ExercisesController < ApplicationController
  before_action :require_login

  def index
    @exercises = Exercise.all
  end

  def new
    @exercise = Exercise.new
    @exercise.build_category
    @exercise.build_muscle_group
  end

  def create
    @exercise = Exercise.create(exercise_params)
    @exercise.name = @exercise.name.titleize
    @exercise.user_id = current_user.id
    if @exercise.save
      redirect_to @exercise
    else
      flash[:message] = @exercise.errors.full_messages
      redirect_to new_exercise_path
    end
  end

  def show
    @exercise = Exercise.find_by(id: params[:id])
  end

  def edit
  end

  def delete
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :private, :muscle_group_id, :category_id)
  end

end
