class User < ApplicationRecord
    
    validates :email, presence: true, 'valid_email_2/email': true
    has_secure_password

    has_many :friendships
    has_many :introverts, through: :friendships
end
