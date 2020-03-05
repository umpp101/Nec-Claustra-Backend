class MessagesController < ApplicationController
  skip_before_action :authorized

  def index
    messages = Message.all
    # MessageSerializer.new(messages).serialized_json
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
    params.require(:message).permit(:content, :conversation_id, :user_id)
  end
  


#   def translate_fetch
#     uri = URI.parse("https://api.us-south.language-translator.watson.cloud.ibm.com/instances/71520e26-af24-4dd7-97d9-8e9135217e55/v3/translate?version=2018-05-01")
#     request = Net::HTTP::Post.new(uri)
#     request.basic_auth("apikey", "O_9KnQNAj3r5edUWLOJDVnvObSrZo0FgFc01C34h-CSz")
#     request.content_type = "application/json"
#     request.body = JSON.dump({
#       "text" => [
#         "Hello, world! ",
#         "How are you?",
#       ],
#       "model_id" => "en-es",
#     })
#     req_options = {
#       use_ssl: uri.scheme == "https",
#     }
#     response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
#       http.request(request)
#     end
#   end
end
