# frozen_string_literal: true

class ChatChannel < ApplicationCable::Channel
  def subscribe
    stream_from "chat_channel"
  end


  def alert(data)
    # byebug
    socket = { check: true }
      ActionCable.server.broadcast("global", socket)
  end


  def speak(data)
    # byebug
    # find the convo that belongs to the message you just sent from react
    convo = Conversation.find(data["message"]["conversation_id"])


    other_user_lang = get_other_user(convo, data["message"]["user_id"]).language
    # byebug
    current_user_lang = detect_language(data["message"]["content"])


    unless other_user_lang != current_user_lang
      message_content = data["message"]["content"]

      message = Message.create!(content: message_content,translated_content: message_content, user_id: data["message"]["user_id"], conversation_id: data["message"]["conversation_id"])
      socket = { true_message: message }
      #byebug
      ActionCable.server.broadcast("chat_#{data["message"]["conversation_id"]}", socket)
    else
      translate_message = google_translation(data["message"]["content"], other_user_lang)
      # byebug
      translated_message = Message.create!(content: data["message"]["content"], translated_content: translate_message, user_id: data["message"]["user_id"], conversation_id: data["message"]["conversation_id"])
      # byebug
      socket = { true_message: translated_message }
      # byebug
      ActionCable.server.broadcast("chat_#{data["message"]["conversation_id"]}", socket)
    end
    # byebug
  end

  def create(opts)
    Message.create(
      body: opts.fetch("body"),
    )
  end

  def convo_connector(data)
    # byebug
    # we are trying to loop through a user convos and stream accordingly to each convo
    user_id = JSON.parse(data["message"])["user_id"]
    user = User.find(user_id)
    user.conversations.each do |convo|
      stream_from "chat_#{convo.id}"
    end
    stream_from "global"
    # socket = { check: true }
    # ActionCable.server.broadcast("chat_#{data["user_id"]}", socket)
  end

  def unsubscribed; end

  private

  def detect_language(text)
    project_id = ENV["CLOUD_PROJECT_ID"]
    translate = Google::Cloud::Translate.new version: :v2
    detection = translate.detect text.to_s
    user_lang = detection.language
    # byebug
  end

  def google_translation(message, language_code)
    project_id = ENV["CLOUD_PROJECT_ID"]
    translate = Google::Cloud::Translate.new version: :v2
    # byebug
    detection = translate.detect message
    translation = translate.translate message, to: language_code.to_s
    translated_response = translation.text
    # translated_message = translated_response.split('&quot;')[3]
    # byebug
  end

  def get_other_user(convo, current_user_id)
    # byebug
    if current_user_id === convo.receiver_id
      other_user_id = convo.sender_id
      other_user = User.find(other_user_id)
      other_user
    else
      other_user_id = convo.receiver_id
      # byebug
      other_user = User.find(other_user_id)
      other_user
    end
  end
end


