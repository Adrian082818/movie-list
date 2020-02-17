class User < ActiveRecord::Base
    has_secure_password 
    has_many :movies
    # validates :username, presence: true
    # validates :email, presence: true, uniqueness: true 
end
