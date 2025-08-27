class Comment < ApplicationRecord
  validates :comment_body, presence: true, uniqueness: false
end
