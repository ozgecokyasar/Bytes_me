class DrillGroupsController < ApplicationController
  def index
    @drill_groups = DrillGroup.order("id")
  end

  def show
    # if redirect from new drill create =>
     if Drill.find_by(id: params[:id]) != nil
       @drill_group = Drill.find(params[:id]).drill_group
     else
       @drill_group = DrillGroup.find_by(id: params[:id])
     end
     @drills = @drill_group.drills
   end

  def new
    @drill_group = DrillGroup.new
  end

  def create
    @drill_group = DrillGroup.new(drill_group_params)

    if @drill_group.save
      flash[:notice] = "Drill Group created successfully"
      redirect_to(drill_groups_path)
    else
      flash[:error] = "Drill was not created"
      render("new")
    end
  end

  def edit
    @drill_group = DrillGroup.find(params[:id])
  end

  def update
    @drill_group = DrillGroup.find(params[:id])
    if @drill_group.update_attributes(drill_group_params)
      flash[:notice] = "Drill Group Updated"
      redirect_to(drill_groups_path)
    else
      render("edit")
    end
  end

  def delete
    @drill_group = DrillGroup.find(params[:id])
  end

  def destroy
    @drill_group = DrillGroup.find(params[:id])
    @drill_group.destroy

    flash[:notice] = "Drill Group destroyed!"
    redirect_to(drill_groups_path)
  end

  private
  def drill_group_params
    params.require(:drill_group).permit(:drill_group_name, :difficulty)
  end
end
