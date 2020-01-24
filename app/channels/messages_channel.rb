class MessagesChannel < ApplicationCable::Channel
  # def subscribed
  #   conversation = Conversation.find(params[:conversation])
  #   stream_for conversation
  # end
  # # **********************
  # def speak(data)
  #   message = Message.create(content: data['message'])
  #   socket = { message: message.content }
  #   MessagesChannel.broadcast_to('chat_channel', socket)
  # end
  # # **********************
  # def unsubscribed
  # end

  def subscribed
    stream_from "messages"
  end
end