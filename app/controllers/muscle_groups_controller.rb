class MusclegroupsController < ApplicationController

  def index
    @muscle_groups = MuscleGroup.all
  end


  def show

  end


end
