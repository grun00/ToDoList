class Comment < ApplicationRecord
  enum like: {none: 0, liked: 10, disliked: 20}

  belongs_to :user
  belongs_to :task
end
