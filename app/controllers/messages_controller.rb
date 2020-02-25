class MessagesController < ApplicationController
    skip_before_action :authorized
    
    
    
    
def index
        messages = Message.all
        # MessageSerializer.new(messages).serialized_json
        render json: {messages: messages} , :include => [:user]
    end


    def create
        byebug
        message = message.new(message_params)
        # message.user_id = current_user.id
        # message.conversation_id = params[:conversation_id]
        if message.save
            render json: {messages: messages}
        else
            render json: {error: "Something went wrong"}
        end
    end
    
    def show
        message = Message.find(params[:id])
        render json: MessageSerializer.new(message) 
    end

    def message_params
        params.require(:message).permit(:content, :conversation_id, :user_id)
    end

end