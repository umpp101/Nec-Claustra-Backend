class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :user_name, :password_digest, :language, :nationality
  has_many :messages
end
