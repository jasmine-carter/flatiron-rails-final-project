module ExercisesHelper

  def display_create_exercise_link(exercise)
    if params[:muscle_group_id]
      @muscle_group = MuscleGroup.find_by(id: params[:muscle_group_id])
        content_tag(:div,link_to("Create an Exercise for #{@muscle_group.name}", new_muscle_group_exercise_path(@muscle_group.id)))
    else
        content_tag(:div, link_to("Create a New Exercise", new_exercise_path))
    end
  end

end
