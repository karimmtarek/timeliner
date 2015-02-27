class MilestonesController < ApplicationController

  def index
    @milestones = current_user.milestones.all
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
    @milestone = Milestone.find(params[:id])
  end

  def update
    @milestone = Milestone.find(params[:id])

    if @milestone.update(milestone_params)
      redirect_to milestones_path, notice: 'Mile stone updated!'
    else
      render :edit
    end
  end

  def destroy
    @milestone = Milestone.find(params[:id])

    @milestone.destroy
    redirect_to :back
  end

  def import_linkedin_data
    client = LinkedIn::Client.new(ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET'])

    if current_user.access_key && current_user.access_secret
      client.authorize_from_access(current_user.access_key, current_user.access_secret)
    else
      raise 'You must re-sync with linkedin'
    end

    @positions = client.profile(:fields => ["positions"])
    @positions[:positions][:all].each do |position|
      milestone = Milestone.create(
        user_id: current_user.id,
        title: position.title,
        company: position.company.name,
        # company_url
        # location
        date_start: Date.new(position.start_date.year, position.start_date.month),
        present: position.is_current,
        description: position.summary
      )
      milestone.update(date_end: Date.new(position.end_date.year, position.end_date.month)) unless position.end_date.nil?
    end


    @education = client.profile(:fields => ["educations"])
    # binding.pry
    @education[:educations][:all].each do |education|
      milestone = Milestone.create(
        user_id: current_user.id,
        title: education.field_of_study,
        company: education.school_name,
        date_start: Date.new(education.start_date.year),
        date_end: Date.new(education.end_date.year),
        present: education.is_current,
        description: education.notes
      )
    end


    redirect_to milestones_path
  end

  private

  def milestone_params
    params.require(:milestone).permit(:title, :company, :company_url, :location, :description, :date_start, :date_end)
  end

end
