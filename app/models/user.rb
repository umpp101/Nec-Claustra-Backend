class User < ApplicationRecord
    has_secure_password

    has_many :sender_conversations, foreign_key: :sender_id, class_name: "Conversation"
    has_many :senders, through: :sender_conversations, source: :sender

    has_many :receiver_conversations, foreign_key: :receiver_id, class_name: "Conversation"
    has_many :receivers, through: :receiver_conversations, source: :receiver

    has_many :sender_messages, through: :sender_conversations, source: :messages
    has_many :receiver_messages, through: :receiver_conversations, source: :messages

    has_many :messages
    
    def conversations
        sender_conversations + receiver_conversations
    end

    def conversation_ids
        conversations.map{|el| el.id}
    end


end
