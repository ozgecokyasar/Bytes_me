class DrillsController < ApplicationController

  def index
    @drills = Drill.order("id")
  end

  # def show
  # end

  def new
    @drill = Drill.new
  end

  def create
    @drill = Drill.new(drill_params)

    if @drill.save
      flash[:notice] = "Drill created successfully"
      redirect_to(drills_path)
    else
      flash[:error] = "Drill was not created!"
      render("new")
    end
  end

  def edit
    @drill = Drill.find(params[:id])
  end

  def update
    @drill = Drill.new(drill_params)

    if @drill.save
      flash[:notice] = "Drill created successfully"
      redirect_to(drills_path)
    else
      flash[:error] = "Drill was not created!"
      render("new")
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
    params.require(:drill).permit(:title, :points, :drill_group_id)
  end
end
