class Introvert < ApplicationRecord
    has_many :friendships
    has_many :users, through: :friendships
end
