class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { minimum: 8,  too_short: "Must be at least 8 characters long."}
  validates :password, presence: true, length: { minimum: 8, too_short: "Password be at least 8 characters long." }
end
