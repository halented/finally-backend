class Friendship < ApplicationRecord
    belongs_to :user
    belongs_to :introvert
    has_many :hangouts
    has_many :purposes, through: :hangouts
end
