class User < ApplicationRecord
    include EmailValidatable
    
    has_secure_password
    validates :email, uniqueness: true, email: true

    has_many :friendships
    has_many :introverts, through: :friendships
end
