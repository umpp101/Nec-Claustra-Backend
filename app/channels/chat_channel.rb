class ChatChannel < ApplicationCable::Channel
  def subscribe
    stream_from "chat_channel"
  end


  def alert(data)
    alert, type = [data["message"]["alert_receviers"],data["message"]["type"]]
    socket = {alert_receviers: alert, type: type}
    data.alert.each do |user_id|
      ActionCable.server.broadcast("user_stream_#{user_id}", socket)
    end
  end


  def speak(data)
    convo_id, user_id, content = [data["message"]["conversation_id"],data["message"]["user_id"],data["message"]["content"]]
    convo = Conversation.find(convo_id)
    current_user_lang, other_user_lang = [detect_language(content) , get_other_user_lang(convo, user_id)]
    user_name = get_user(convo, user_id).user_name
    if other_user_lang != current_user_lang
      message = google_translation(content, other_user_lang)
    else
      message = content
    end
      message = Message.create!(content: content,translated_content: message, user_id: user_id, conversation_id: convo_id)
      socket = { true_message: message,  type:"new_message", name: user_name}
      data["message"]["alert_receviers"].each do |user_id|
        ActionCable.server.broadcast("user_stream_#{user_id}", socket)
      end
    
  end


  def convo_connector(data)
    user_id = JSON.parse(data["message"])["user_id"]
    user = User.find(user_id)
    stream_from "user_stream_#{user.id}"
  end

  def unsubscribed; end

private

  def detect_language(text)
    project_id = ENV["CLOUD_PROJECT_ID"]
    translate = Google::Cloud::Translate.new version: :v2
    detection = translate.detect text.to_s
    user_lang = detection.language
  end

  def google_translation(message, language_code)
    project_id = ENV["CLOUD_PROJECT_ID"]
    translate = Google::Cloud::Translate.new version: :v2
    detection = translate.detect message
    translation = translate.translate message, to: language_code.to_s
    translated_response = translation.text
  end

  def get_other_user_lang(convo, current_user_id)   
    if current_user_id === convo.receiver_id
      other_user_id = convo.sender_id
    else
      other_user_id = convo.receiver_id
    end
      other_user = User.find(other_user_id)
      other_user.language
  end
  
  def get_user(convo, current_user_id)
    if current_user_id === convo.receiver_id
      user_id = convo.receiver_id
    else
      user_id = convo.sender_id
    end
      user = User.find(user_id)
      user
  end
end


