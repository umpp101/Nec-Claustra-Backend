class User < ApplicationRecord
    has_secure_password

   
    has_many :messages, through: :conversations

    has_many :sender_conversation, foreign_key: :receiver_id, class_name: "Conversation"
    has_many :senders, through: :sender_conversation, source: :sender
    has_many :receiver_conversation, foreign_key: :sender_id, class_name: "Conversation"
    has_many :receivers, through: :receiver_conversation, source: :receiver
end
