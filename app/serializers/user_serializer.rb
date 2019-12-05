class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :name
end
