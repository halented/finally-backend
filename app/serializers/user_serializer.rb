class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :name, :introverts, :hangouts
end
