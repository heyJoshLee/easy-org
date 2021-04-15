class MessagesController < ApplicationController

  before_action :require_user, only: [:create]

  def create
    message = current_user.messages.build(message_params)
    @project = Project.find(params[:project_id])
    message.project_id = @project.id
    if message.save
      ChatRoomChannel.broadcast_to @project.id,
                              body: message.body,
                              user: message.user.username
    else
      puts "ERROR"
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end


end