class User < ApplicationRecord
    has_secure_password

    has_many :sender_conversations, foreign_key: :sender_id, class_name: "Conversation"
    has_many :senders, through: :sender_conversations, source: :sender

    has_many :receiver_conversations, foreign_key: :receiver_id, class_name: "Conversation"
    has_many :receivers, through: :receiver_conversations, source: :receiver

    has_many :sender_messages, through: :sender_conversations, source: :messages
    has_many :receiver_messages, through: :receiver_conversations, source: :messages

    def messages_sent
        self.sender_messages.where(user_id: self.id)
    end

    def messages_received
        self.receiver_messages.where(user_id: self.id)
    end

    def my_convos
        # this filters all the convos and outputs the ones where my user_id im either a sender or receiver
        Conversation.all.select{|convo| convo.sender_id === self.id || convo.receiver_id === self.id}
    end

end
