class MessagesController < ApplicationController
  skip_before_action :authorized

  def index
    messages = Message.all
    render json: { messages: messages }, :include => [:user]
  end


  private
  def message_params
    params.require(:message).permit(:content, :translated_content, :conversation_id, :user_id)
  end

end
