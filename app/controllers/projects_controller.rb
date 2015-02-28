class ProjectsController < ApplicationController
  def new
    @project = Project.new
    @project.images.build
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
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      milestones_path
    else
      render :edit
    end

  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to milestones_path

  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :role, :client, :published_on, :link_live, :link_source, :milestone_id, images_attributes: [:image, :description])
  end

end


