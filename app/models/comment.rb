class Comment < ApplicationRecord
  enum like_status: {neither: 0, like: 10, dislike: 20}

  belongs_to :user
  belongs_to :task
end
