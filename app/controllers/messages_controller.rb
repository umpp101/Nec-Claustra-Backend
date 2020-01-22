class MessagesController < ApplicationController

    def index
        messages = Message.all
        render json: {messages: messages}
    end

    def show
        message = Message.find(params[:id])
        render json: message
    end

    def create
        message = Message.new(message_params)
        byebug
        if message.save
         # render json: message
        serialized_data = MessageSerializer.new(message).serialized_json
         # takes an object from our models as it’s first argument. This object matches the one we specified in the MessagesChannel
            MessagesChannel.broadcast_to conversation, serialized_data
            head :ok
        else
            render json: {error: "Something went wrong"}
        end
    end

    def message_params
        params.require(:message).permit(:content, :conversation_id)
    end

end