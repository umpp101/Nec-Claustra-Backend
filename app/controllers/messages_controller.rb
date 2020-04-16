class MessagesController < ApplicationController
  skip_before_action :authorized

  def index
    messages = Message.all
    render json: { messages: messages }, :include => [:user]
  end

  def create
    # byebug
    message = message.new(message_params)
    if message.save
      render json: { messages: messages }
    else
      render json: { error: "Something went wrong" }
    end
  end

  def show
    message = Message.find(params[:id])
    render json: MessageSerializer.new(message)
  end

  private

  def message_params
    params.require(:message).permit(:content, :translated_content, :conversation_id, :user_id)
  end

end
