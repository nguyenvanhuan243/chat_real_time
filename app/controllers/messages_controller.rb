class MessagesController < ApplicationController

  def create
    message = Message.new(message_params.merge(user_id: current_user.id))
    produce_message(message) if message.save
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end

  def produce_message(message)
    ActionCable.server.broadcast 'channel_messages',
      message: message.content,
      user: message.user.username
    head :ok
    puts "################## produce_message DONE!"
    puts "################## produce_message DONE!"
    puts "################## produce_message DONE!"
  end
end
