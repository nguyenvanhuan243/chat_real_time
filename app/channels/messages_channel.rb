class MessagesChannel < ApplicationCable::Channel  
  def subscribed
    stream_from 'channel_messages'
  end
end  
