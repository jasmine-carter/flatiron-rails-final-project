class MuscleGroupsController < ApplicationController
before_action :require_login

  def index
    @muscle_groups = MuscleGroup.all
  end

end
