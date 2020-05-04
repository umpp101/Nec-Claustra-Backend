class ConversationsController < ApplicationController
  skip_before_action :authorized

  def index
    user = User.find(params[:user_id])
    render json: { conversations: user.conversations }, :include => [:messages]
  end

  def create
    # byebug
    if Conversation.between(conversation_params[:sender_id], conversation_params[:receiver_id]).present?
      conversation = Conversation.find_by(sender_id: conversation_params[:sender_id], receiver_id: conversation_params[:receiver_id]) ?
        Conversation.find_by(sender_id: conversation_params[:sender_id], receiver_id: conversation_params[:receiver_id]) :
        Conversation.find_by(sender_id: conversation_params[:receiver_id], receiver_id: conversation_params[:sender_id])
      render json: { conversation: conversation }, :include => [:messages]
    else
      conversation = Conversation.create!(conversation_params)
      if !conversation.valid?
        render json: { error: "Something went wrong" }
      else
        render json: { conversation: conversation }, :include => [:messages]
      end
    end
  end

  def show
    user = User.find(params[:user_id])
    if conversation = user.conversations.find { |convo| convo.id == params[:id].to_i }
      render json: { conversation: conversation }, :include => [:messages]
    else
      render json: { error: "Convo not found." }
    end
  end

  def destroy
    # byebug
    conversation = Conversation.find(params[:id])
    if conversation.destroy
      render json: { conversation: conversation }, :include => [:messages]
    else
      render json: { error: "Something went wrong" }
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:sender_id, :receiver_id)
  end
end
