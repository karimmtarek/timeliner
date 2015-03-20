class ProjectsController < ApplicationController
  before_action :set_user

  def new
    @project = Project.new
    # @project.images.build
  end

  def create
    @project   = Project.new(project_params)

    if @project.save
      redirect_to milestones_path, notice: "Project #{@project.title} created!"
    else
      render :new
    end
  end

  def edit
    @project = Project.friendly.find(params[:id])
  end

  def update
    @project = Project.friendly.find(params[:id])

    if @project.update(project_params)
      redirect_to milestones_path
    else
      render :edit
    end

  end

  def destroy
    @project = Project.friendly.find(params[:id])
    @project.destroy
    redirect_to milestones_path

  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :role, :client, :published_on, :link_live, :link_source, :milestone_id, images_attributes: [:id, :image, :description, :_destroy])
  end

end


