class CommentsController < ApplicationController

  before_action :set_comment, only: [:destroy]
  before_action :require_user, only: [:create, :destroy]

  def create
    @project = Project.find(params[:project_id])
    @organization = @project.organization
    require_membership(@organization.id)
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    
    if @comment.save
      respond_to do |format|
        format.js
      end
    else 
      puts "error"
    end
  end

  def destroy
    require_group_admin(@comment.post.project.organization)
    @comment.destroy
    respond_to do |format|
      format.js
    end
  end

  private 

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end