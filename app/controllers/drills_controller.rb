class DrillsController < ApplicationController

  def index
    @drills = Drill.order("id")
  end

  def show
    if current_user === nil
      redirect_to new_user_path
    end
    @drill = Drill.find(params[:id])
    @answers = @drill.answers
    @attempted_drill = AttemptedDrill.new
  end

  def new
    @drill = Drill.new
    @drill.drill_group_id = params[:groupsId]
    4.times { @drill.answers.build}


  end

  def create
    @drill = Drill.new(drill_params)
    if @drill.save
      flash[:notice] = "Drill created successfully"
      redirect_to(drill_group_path(@drill.drill_group))
    else
      flash[:error] = "Drill was not created!"
      render("new")
    end
  end

  def edit
    @drill = Drill.find(params[:id])
  end

  def update
    @drill = Drill.find(params[:id])
    if @drill.update_attributes(drill_params)
      flash[:notice] = "Drill updated successfully"
      redirect_to(drills_path)
    else
      flash[:error] = "Drill was not updated!"
      render("edit")
    end
  end

  def delete
    @drill = Drill.find(params[:id])
  end

  def destroy
    @drill = Drill.find(params[:id])
    @drill.destroy

    flash[:notice] = "Drill destroyed successfully."
    redirect_to(drills_path)
  end

  private

  def drill_params
    params.require(:drill).permit(:title, :points, :drill_group_id, answers_attributes: [:body, :is_correct])
  end
end
