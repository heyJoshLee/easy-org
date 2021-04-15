class CommentsController < ApplicationController


  def create
    byebug
    project = Project.find(params[:project_id])
    organization = project.organization
    @post = Post.find(params[:post_id])
    comment = @post.comments.build(comment_params)
    comment.user_id = current_user.id
    
    
    
    if comment.save
      respond_to do |format|
        byebug

        format.js
      end
    else 
      puts "error"
    end

  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end