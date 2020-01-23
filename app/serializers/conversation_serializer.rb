class ConversationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :sender_id, :receiver_id, :created_at
  # has_many :messages 
end
