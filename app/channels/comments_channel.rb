class CommentsChannel < ApplicationCable::Channel
  def subscribed
    # Used by client, and indicate the channel where it has to get data from server
    stream_from "comments"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
