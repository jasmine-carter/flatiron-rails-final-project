class ExercisesController < ApplicationController

  def new
    @exercise = Exercise.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def delete
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :private)
  end

end