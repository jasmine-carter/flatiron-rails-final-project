class ExercisesController < ApplicationController

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
    @exercise.save
    redirect_to @exercise
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
