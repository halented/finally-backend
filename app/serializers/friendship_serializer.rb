class FriendshipSerializer < ActiveModel::Serializer
    belongs_to :user
    belongs_to :introvert
    has_many :hangouts
    attributes :id, :user, :introvert
end