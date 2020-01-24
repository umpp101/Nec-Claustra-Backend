class MessagesController < ApplicationController
    skip_before_action :authorized
    
    
    
    
def index
        messages = Message.all
        # MessageSerializer.new(messages).serialized_json
        render json: {messages: messages} , :include => [:user]
    end


    def create
        message = Message.new(message_params)
        if message.save
        ActionCable.server.broadcast 'messages',
            message: message,
            user: message.user.username,
            user_facing: true
        head :ok
        else 
        ActionCable.server.broadcast 'messages',
            errors: message.errors
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