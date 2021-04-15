class ProjectsController < ApplicationController

  before_action :set_project, only: [:show]
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
    @active_posts = @project.posts.where(status: "Active").paginate(page: params[:page], per_page: 5)
    @archieved_posts = @project.posts.where(status: "Archived").paginate(page: params[:page], per_page: 5)
    @complete_posts = @project.posts.where(status: "Complete").paginate(page: params[:page], per_page: 5)
    @organization = @project.organization
    @messages = @project.messages
    @sticky_message = StickyMessage.new
    @sticky_type = "project"
    @sticky_type_id = @project.id
  end


  private

  def set_organization
    @organization = Organization.find(params[:organization_id])
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end

end