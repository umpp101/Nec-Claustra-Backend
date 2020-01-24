class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :user_name, :language, :nationality
  has_many :sender_conversations
  has_many :receiver_conversations
  # send messages in convo serializer
end
