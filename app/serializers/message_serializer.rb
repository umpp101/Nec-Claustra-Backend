class MessageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :content, :conversation_id, :created_at

end
