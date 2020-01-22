class MessageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :content, :created_at
end
