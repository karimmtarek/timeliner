# require "application_responder"

class MilestonesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:show]

  def index
    # @milestones = current_user.milestones.current + current_user.milestones.older
    @milestones = current_user.milestones.load.order(date_start: :desc)
  end

  def show
    # @user = User.find(params[:account_id])
    @milestone = Milestone.friendly.find(params[:id])
    render :show
    # binding.pry
  end

  def new
    @milestone = current_user.milestones.new
  end

  def create
    @milestone = current_user.milestones.new(milestone_params)

    if @milestone.save
      redirect_to milestones_path, notice: 'done!'
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
      redirect_to milestones_path, notice: 'Mile stone updated!'
    else
      render :edit
    end
  end

  def destroy
    @milestone = Milestone.friendly.find(params[:id])

    @milestone.destroy
    redirect_to :back
  end

  def import_linkedin_data
    client = LinkedIn::Client.new(ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET'])

    if current_user.access_key && current_user.access_secret
      client.authorize_from_access(current_user.access_key, current_user.access_secret)
      Milestone.create_from_position(client, current_user)
      Milestone.create_from_education(client, current_user)
    else
      raise 'You must re-sync with linkedin'
    end

    redirect_to milestones_path
  end

  private

  def milestone_params
    params.require(:milestone).permit(:title, :company, :company_url, :location, :description, :date_start, :date_end)
  end

end
