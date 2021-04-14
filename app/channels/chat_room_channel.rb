class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_for room
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def room
    params[:room_id]
  end
end
