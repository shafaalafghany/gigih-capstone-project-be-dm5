class User < ApplicationRecord
    has_secure_password

    validates :nama, presence: true
    validates :username, presence: true, uniqueness: true
    validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
end
