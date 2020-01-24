class ConversationsController < ApplicationController
    skip_before_action :authorized
    # skip_before_action :authorized


    def index
    # this is going to be used for the front-end’s initial fetch request to receive the current existing conversations and their messages.
    # byebug
    conversations = Conversation.all

    # # USE USERS QUERY PARAM (param[:user]) AND LOGIC TO GRAB CONVOS OF THAT USER
    #     # conversations = Conversation.all.select{|convo| convo.sender_id === user.id || convo.receiver_id === user.id}
    # if params[:user]
    #     byebug
    #     # conversations = Conversation.where()
    #     conversations = Conversation.find(param[:id] === params[:user].id)
    # end

    # render json: ConversationSerializer.new(conversations, {include: [:messages]})
    render json: {conversations: conversations} , :include => [:messages]
    end
    
    def create
        # user_id = current_user.id
        conversation = Conversation.new(conversation_params)    
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


    def show
        conversation = Conversation.find(params[:id])
        render json: ConversationSerializer.new(conversation, {include: [:messages]}) 
    end


def destroy
    conversation = Conversation.find(params[:id])
    if conversation.destroy
        render json: {message: "Successfully deleted conversation"}
    else
        render json: {error: "Something went wrong"}
    end
end



def my_convos
    user_convos = User.find(params[:user_id]).my_convos
    render json: ConversationSerializer.new(user_convos, {include: [:messages]}) 
end


private

def conversation_params
    params.require(:conversation).permit(:sender_id, :receiver_id)
end


end