class MilestonesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_user

  def index
    @milestones = current_user.milestones.load.order(date_start: :desc)
  end

  def show
    @milestone = Milestone.friendly.find(params[:id])
    render :show
  end

  def new
    @milestone = current_user.milestones.new
  end

  def create
    @milestone = current_user.milestones.new(milestone_params)

    if @milestone.save
      redirect_to milestones_path, notice: 'Milestone created!'
    else
      render :new
    end
  end

  def edit
    @milestone = Milestone.friendly.find(params[:id])
  end

  def update
    @milestone = Milestone.friendly.find(params[:id])

    if @milestone.update(milestone_params)
      redirect_to milestones_path, notice: 'Milestone updated!'
    else
      render :edit
    end
  end

  def destroy
    @milestone = Milestone.friendly.find(params[:id])

    @milestone.destroy
    redirect_to :back, notice: 'Milestone destroyed!'
  end

  private

  def milestone_params
    params.require(:milestone).permit(:title, :company, :company_url, :location, :description, :date_start, :date_end, :present)
  end
end
