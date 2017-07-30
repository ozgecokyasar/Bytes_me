class AttemptedDrillsController < ApplicationController
  def create
    if(current_user === nil)
      redirect_to new_user_path
  else
    @attempted_drill = AttemptedDrill.new(drill_id: Answer.find_by_id(attempt_params).drill.id)
    @attempted_drill.user_id = current_user.id
    @attempted_drill.drill_group_id = Answer.find_by_id(attempt_params).drill.drill_group.id
    @attempted_drill.is_correct = Answer.find_by_id(attempt_params).is_correct?
    @attempted_drill.save
    if(@attempted_drill.is_correct)
      current_user.score = current_user.score + Drill.find_by_id(@attempted_drill.drill_id).points
    end
    redirect_to drill_group_path(Answer.find_by_id(attempt_params).drill.id)
  end
  end
  private

  def attempt_params
    params["answer"]
  end
end
