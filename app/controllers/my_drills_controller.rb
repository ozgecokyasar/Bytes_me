class MyDrillsController < ApplicationController

  def index

    @my_drills = {}
    @drill_groups = []
    my_att_drills = AttemptedDrill.where(user_id: current_user.id)
    my_att_drills.each do |drill|
      current_drill_group = DrillGroup.find_by_id(drill.drill_group_id)
      if !@my_drills.key?(current_drill_group.drill_group_name)
        group_total = my_att_drills.where(drill_group_id: current_drill_group.id)
        correct =  group_total.where(is_correct: true)
        score = (correct.count.to_f/group_total.count).round(2) * 100
        @my_drills[current_drill_group.drill_group_name] = score
        @drill_groups << current_drill_group
      end
    end
  end

  def delete
    @drill_group = DrillGroup.find(params[:id])
  end

  def destroy
    att_drills = AttemptedDrill.where(user_id: current_user.id).where(drill_group_id: params[:id])
    att_drills.destroy_all

    redirect_to(my_drills_path, notice: "Drills deleted!")
  end

end
