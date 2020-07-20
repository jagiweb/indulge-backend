class User < ApplicationRecord
    has_many :tournaments
    has_secure_password
    validates :username, :name, :lastname, :email, :password, presence: true
    validates :password, length: { minimum: 8 }
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :email, :username, uniqueness: true
end
