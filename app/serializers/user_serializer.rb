class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :user_name, :password_digest, :language, :nationality
  has_many :sender_conversations
  has_many :receiver_conversations
  # send messages in convo serializer
end
