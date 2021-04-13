class MessagesController < ApplicationController

  def create
    message = current_user.messages.build(message_params)
    @project = Project.find(params[:project_id])
    message.project_id = @project.id
    if message.save
      redirect_to organization_project_path(@project.organization, @project)
    else
      puts "ERROR"
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

end