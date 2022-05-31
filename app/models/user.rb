class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true , format: {with: /\A[a-zA-Z]+\z/, message: "only allows letters"}#, allows nil: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, confirmation: true, length: {minimum: 6}

    has_many :posts
end
