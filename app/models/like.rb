class Like < ApplicationRecord
  enum current: {neither: 0, plus: 10, minus: 20}

  belongs_to :user
  belongs_to :comment
end
