class ChatChannel < ApplicationCable::Channel
  # need to create a stream
  # In this stream, clients and server will send and receive data.
  def subscribe
    # byebug
    # we only stream from the channel that the user belongs to
    stream_from "chat_channel"
  end

  # This will receive data, manipulate that data to create a new instance of a Message,
  # and then broadcast that new message into the stream
  def speak(data)
    # find convo
    convo = Conversation.find(data["message"]["conversation_id"])
    # am I receiver or sender
    other_user_lang = get_other_user(convo, data["message"]["user_id"]).language
    #find my lang
    current_user_lang = User.find(data['message']["user_id"]).language
    # byebug
    # if my lang is english, then i should save it 
    if current_user_lang == "en"
      message = Message.create!(content: data["message"]["content"], user_id: data["message"]["user_id"],conversation_id: data["message"]["conversation_id"])
      #if the other guys lang is english too then show him the message
      if other_user_lang == "en"
        socket = { true_message: message }
        ActionCable.server.broadcast("chat_#{data["message"]["conversation_id"]}", socket)
      else
        #if not then translate the message to the other guys lang then show the message
        translated_message = fetch_response(message, "en", other_user_lang)
        # byebug
        socket = { true_message: translated_message }
        ActionCable.server.broadcast("chat_#{data["message"]["conversation_id"]}", socket)
      end
    else
      # if my message isnt english, then translate it to english and then save it 
      # byebug
      translated_message = fetch_response(data["message"]["content"], current_user_lang, "en")
      # byebug
      message = Message.create!({content: translated_message, user_id: data["message"]["user_id"],conversation_id: data["message"]["conversation_id"]})
      #if the other guys lang is english, then show him the message
      if other_user_lang == "en"
        socket = { true_message: message }
        ActionCable.server.broadcast("chat_#{data["message"]["conversation_id"]}", socket)
      else
        translated_message = fetch_response(message, "en", other_user_lang)
        # byebug=
        socket = { true_message: translated_message }
        ActionCable.server.broadcast("chat_#{data["message"]["conversation_id"]}", socket)
      end
    end
  end

  def create(opts)
    Message.create(
      body: opts.fetch("body"),
    )
  end

  def convo_connector(data)
    # byebugda
    #we are trying to loop through a user convos and stream accordingly to each convo
    user_id = JSON.parse(data["message"])["user_id"]
    user = User.find(user_id)
    user.conversations.each do |convo|
      stream_from "chat_#{convo.id}"
    end
  end

  def unsubscribed
  end

  private
  def translate_fetch(message, from_lang, to_lang)
    # byebug
    # uri = URI.parse("https://api.us-south.language-translator.watson.cloud.ibm.com/instances/71520e26-af24-4dd7-97d9-8e9135217e55/v3/translate?version=2018-05-01")
    uri = URI.parse("https://api.us-south.language-translator.watson.cloud.ibm.com/instances/71520e26-af24-4dd7-97d9-8e9135217e55/v3/translate?version=2018-05-01")
    request = Net::HTTP::Post.new(uri)
    request.basic_auth("apikey", "*****")
    request.content_type = "application/json"
    request.body = JSON.dump({
      "text" => "#{message}",
      "model_id" => "#{from_lang}-#{to_lang}",
    })
    req_options = {
      use_ssl: uri.scheme == "https",
    }
    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
  end

  def fetch_response(message, from_lang, to_lang)
    
    response = JSON.parse(translate_fetch(message, from_lang, to_lang).body)
    byebug
    word = response["translations"][0]["translation"]
  end


  def get_other_user(convo, current_user_id)
    # byebug
    if (current_user_id === convo.receiver_id)
      other_user_id = convo.sender_id
      other_user = User.find(other_user_id)
      return other_user
    else
      other_user_id = convo.receiver_id
      # byebug
      other_user = User.find(other_user_id)
      return other_user
    end
  end

end
