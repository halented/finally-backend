class HangoutSerializer < ActiveModel::Serializer
    belongs_to :friendship, include_nested_associations: true
    attributes :id, :location, :purpose, :friendship
end