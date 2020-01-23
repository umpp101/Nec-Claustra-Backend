class ConversationsController < ApplicationController

    def index
    # this is going to be used for the front-end’s initial fetch request to receive the current existing conversations and their messages.
    conversations = Conversation.all
    render json: {conversations: conversations}, :include => [:messages]
end

def show
    conversation = Conversation.find(params[:id])
    render json: conversations
end

def create
    # user_id = current_user.id
    conversation = Conversation.new(conversation_params)
    conversation.sender_id = 5
    conversation.receiver_id = 3

    if conversation.save
        # render json: conversations
    # we need to do this(initialize new Serializer instances), so our create method can broadcast the data to our channels
    serialized_data = ActiveModelSerializers::Adapter::Json.new(ConversationSerializer.new(conversation)).serializable_hash
      ActionCable.server.broadcast 'conversations_channel', serialized_data
      head :ok
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