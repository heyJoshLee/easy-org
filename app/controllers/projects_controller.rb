class ProjectsController < ApplicationController

  before_action :set_organization, only: [:new, :create, :create]

  def new
    @project = Project.new
  end

  def create
    project = @organization.projects.build(project_params)

    if project.save
      flash[:success] = "Project created"
      redirect_to @organization
    else
      render 'new'
    end
  end

  def show

    @project = Project.find(params[:id])
  end

  private

  def set_organization
    @organization = Organization.find(params[:organization_id])
  end

  def project_params
    params.require(:project).permit(:name)
  end

end