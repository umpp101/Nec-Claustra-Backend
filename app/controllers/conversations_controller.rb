class ConversationsController < ApplicationController
def index
    conversations = Conversation.all
    render json: conversations
end

def show
    conservation = Conversation.find(params[:id])
    render json: conversations
end

def create
    user_id = current_user.id
    conversation = Conversation.new(conversation_params)
    conversation.sender_id = user_id
    if conversation.save
        render json: conversations
    else
        render json: {error: "Something went wrong"}
    end
end

def destroy
    conversation = Conversation.find(params[:id])
    if conversation.destroy
        render json: {message: "Successfully deleted conversation"}
    else
        render json: {error: "Something went wrong"}
    end
end

private

def conversation_params
    params.require(:conversation).permit(:sender_id, :receiver_id)
end


end