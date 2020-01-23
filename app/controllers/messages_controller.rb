class MessagesController < ApplicationController

    def index
        messages = Message.all
        # MessageSerializer.new(messages).serialized_json
        render json: {messages: messages} , :include => [:user]
    end

    # def create
    #     message = Message.new(message_params)
    #     byebug
    #     if message.save
    #         # render json: message
    #         serialized_data = MessageSerializer.new(message).serialized_json
    #         # takes an object from our models as it’s first argument. This object matches the one we specified in the MessagesChannel
    #         MessagesChannel.broadcast_to conversation, serialized_data
    #         head :ok
    #     else
    #         render json: {error: "Something went wrong"}
    #     end
    # end

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
        render json: message
    end

    def message_params
        params.require(:message).permit(:content, :conversation_id, :user_id)
    end

end