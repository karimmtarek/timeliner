class ProjectsController < ApplicationController
  before_action :set_user

  def index
    @projects = current_user.projects.all
  end

  def new
    @project = Project.new
  end

  def create
    @project   = current_user.projects.new(project_params)

    if @project.save
      redirect_to projects_path, notice: "Project #{@project.title} created!"
    else
      render :new
    end
  end

  def edit
    @project = current_user.projects.friendly.find(params[:id])
  end

  def update
    @project = current_user.projects.friendly.find(params[:id])

    if @project.update(project_params)
      redirect_to projects_path
    else
      render :edit
    end

  end

  def destroy
    @project = current_user.projects.friendly.find(params[:id])
    @project.destroy
    redirect_to milestones_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :role, :client, :client_url, :published_on, :link_live, :link_source, images_attributes: [:id, :image, :description, :_destroy])
  end

end


