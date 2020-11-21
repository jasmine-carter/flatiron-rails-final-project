class ExercisesController < ApplicationController
  before_action :require_login

  def index
  if @muscle_group = MuscleGroup.find_by(id: params[:muscle_group_id])
      @exercises = @muscle_group.exercises
    else
      @exercises = Exercise.all.alpha_order
    end
  end

  def new
    @exercise = Exercise.new
    @exercise.build_category
    if @muscle_group = MuscleGroup.find_by(id: params[:muscle_group_id])
      @exercise.muscle_group = @muscle_group
    else
      @exercise.build_muscle_group
    end
  end

  def create
    @exercise = Exercise.create(exercise_params)
    @exercise.name = @exercise.name.titleize
    @exercise.user_id = current_user.id
    if @exercise.save
      redirect_to @exercise
    else
      render new_exercise_path
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
