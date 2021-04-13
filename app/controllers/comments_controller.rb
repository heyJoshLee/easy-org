class CommentsController < ApplicationController


  def create
    project = Project.find(params[:project_id])
    organization = project.organization
    post = Post.find(params[:post_id])
    comment = post.comments.build(comment_params)
    comment.user_id = current_user.id
    if comment.save
      puts "success"
    else 
      puts "error"
    end

    redirect_to organization_project_path(organization, project)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end