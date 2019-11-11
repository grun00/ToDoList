class Task < ApplicationRecord
  enum priority: {low: 0, medium: 10, high: 20}

  validates :title, length: {minimum: 4}
  validates :title, length: {maximum: 20}
  validates :description, presence: true 

  belongs_to :user

end
