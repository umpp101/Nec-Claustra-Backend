
# uri = URI.parse("https://api.us-south.language-translator.watson.cloud.ibm.com/instances/71520e26-af24-4dd7-97d9-8e9135217e55/v3/translate?version=2018-05-01")
# request = Net::HTTP::Post.new(uri)
# request.basic_auth("apikey", "O_9KnQNAj3r5edUWLOJDVnvObSrZo0FgFc01C34h-CSz")
# request.content_type = "application/json"
# request.body = JSON.dump({
#   "text" => [
#     "Hello, world! ",
#     "How are you?"
#   ],
#   "model_id" => "en-es"
# })

# req_options = {
#   use_ssl: uri.scheme == "https",
# }

# response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
#   http.request(request)
# end


# byebug









# fetch("https://api.us-south.language-translator.watson.cloud.ibm.com/instances/71520e26-af24-4dd7-97d9-8e9135217e55/v3/translate?version=2018-05-01",{
# method: "POST",
# headers: JSON.stringify({'Content-Type': 'application/json','Accept': 'application/json'}),
# body: JSON.stringify({"text": ["Hello, world! ", "How are you?"], "model_id":"en-es"}),
# auth: JSON.stringify({'user': 'apikey','pass': 'O_9KnQNAj3r5edUWLOJDVnvObSrZo0FgFc01C34h-CSz'})
# }).then(res => res.json())
# .then(console.log)


# response = RestClient.post(
# "https://api.us-south.language-translator.watson.cloud.ibm.com/instances/71520e26-af24-4dd7-97d9-8e9135217e55/v3/translate?version=2018-05-01",
# {"text": ["Hello, world! ", "How are you?"], "model_id":"en-es"}.to_json, 
# {content_type: :json, accept: :json}.to_json,
# auth: {user: 'apikey', pass: 'Figaro.env.aws_translate_key'}.to_json)



# response = RestClient::Request.new({
#     method: :post,
#     url: "https://api.us-south.language-translator.watson.cloud.ibm.com/instances/71520e26-af24-4dd7-97d9-8e9135217e55/v3/translate?version=2018-05-01",
#     headers: 'content_type: :json', 'accept: :json' ,
#     payload: {"text": ["Hello, world! ", "How are you?"], "model_id":"en-es"},
#     auth: {user: 'apikey', pass: 'Figaro.env.aws_translate_key'}
#   }).execute do |response, request, result|
#     case response.code
#     when 400
#       [ :error, parse_json(response.to_str) ]
#     when 200
#       [ :success, parse_json(response.to_str) ]
#     else
#       fail "Invalid response #{response.to_str} received."
#     end
#   end