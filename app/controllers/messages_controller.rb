class MessagesController < ApplicationController

    def index
        messages = Message.all
        render json: messages
    end

    def show
        message = Message.find(params[:id])
        render json: message
    end

    def create
        message = Message.new(message_params)
        if message.save
            render json: message
        else
            render json: {error: "Something went wrong"}
        end
    end

    def message_params
        params.require(:message).permit(:content, :conversation_id)
    end

end