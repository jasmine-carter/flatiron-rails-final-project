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
    binding.pry
    @exercise = Exercise.create(exercise_params)
    @exercise.save
    redirect_to @exercise
  end

  def show
  end

  def edit
  end

  def delete
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :private, muscle_group_attributes: [:name], category_attributes: [:name])
  end

end
