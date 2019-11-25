class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: true
    has_many :friendships
    has_many :introverts, through: :friendships
end
