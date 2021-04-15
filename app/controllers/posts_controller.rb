class PostsController < ApplicationController

  def create
    
    respond_to do |format|
      @organization = Organization.find(params[:organization_id])
      @project = Project.find(params[:project_id])
      @post = @project.posts.build(post_params)
      @post.user_id = current_user.id
      if @post.save
        format.js
      else
        puts "ERROR"
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.js
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