class PostsController < ApplicationController


  def create
    @project = Project.find(params[:project_id])
    post = @project.posts.build(post_params)
    post.user_id = current_user.id
    if post.save
      puts "Success"
      redirect_to organization_project_path(@project.organization, @project)
    else
      puts "Error"
    end
  end


  private


  def post_params
    params.require(:post).permit!
  end

  def set_organization
    @organization = Organization.find(params[:organization_id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

end