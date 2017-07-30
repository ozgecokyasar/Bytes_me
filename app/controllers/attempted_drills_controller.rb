class AttemptedDrillsController < ApplicationController
  def create
    @attempted_drill = AttemptedDrill.new(attempt_params)
    @attempted_drill.user_id = current_user.id
    @attempted_drill.drill_id =
    @attempted_drill.drill_group
    @attempted_drill.save
    redirect_to drill_group_path(@drill_group)
  end
  private

  def attempt_params
    params.require(:attempted_drill).permit(:title, :is_correct?)
  end
end
