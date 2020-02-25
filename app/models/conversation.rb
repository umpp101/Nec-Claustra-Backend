class Conversation < ApplicationRecord
    belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
    belongs_to :receiver, foreign_key: :receiver_id, class_name: 'User'
    has_many :messages

    scope :between, -> (sender_id,receiver_id) do
        where("(conversations.sender_id = ? AND conversations.receiver_id = ?) OR (conversations.receiver_id = ? AND conversations.sender_id = ?)", sender_id, receiver_id, sender_id, receiver_id)
    end
    
    # def unread_message_count(current_user)
    #     self.messages.where("user_id != ? AND read = ?", current_user.id, false).count
    # end
end
