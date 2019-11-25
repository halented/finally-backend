class User < ApplicationRecord
    has_many :friendships
    has_many :introverts, through: :friendships
end
