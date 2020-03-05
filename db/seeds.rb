
# User.destroy_all
# Conversation.destroy_all
# Message.destroy_all


# 10.times do 
#     User.create!(
#     user_name: Faker::Internet.username,
#     password: "hey",
#     language: Faker::Nation.language,
#     nationality: Faker::Nation.nationality,
# )
# end

# 10.times do 
#     Conversation.create!(
#     sender_id: rand((User.all.first.id)..(User.all.last.id)),
#     receiver_id: rand((User.all.first.id)..(User.all.last.id))
#     )
# end


# 10.times do 
#     convo = Conversation.all.sample

#     Message.create!(
#     content: Faker::Hipster.sentence,
#     conversation_id: convo.id,
#     user_id: [convo.sender_id, convo.receiver_id].sample 
#     )
#     end
    
    