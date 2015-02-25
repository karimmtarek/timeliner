class ProjectsController < ApplicationController
  def new
    @project = Project.new
    @project.images.build
  end

  def create
    @project   = Project.new(project_params)
    # binding.pry
    # @project.images.new(params[:project][:image])
    if @project.save
      redirect_to milestones_path, notice: "Project #{@project.title} created!"
    else
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :role, :client, :published_on, :link_live, :link_source, :milestone_id, images_attributes: [:image, :description])
  end

end


