class MuscleGroupsController < ApplicationController

  def index
    @muscle_groups = MuscleGroup.all
  end


  def show

  end


end
