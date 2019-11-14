class Task < ApplicationRecord
  enum priority: {low: 0, medium: 10, high: 20}
  enum status: {incomplete: 0, complete: 10}
  after_initialize :share_default

  validates :title, length: {minimum: 4}
  validates :title, length: {maximum: 20}
  validates :description, presence: true 
  validates :description, length: {maximum: 280} 

  belongs_to :user

  def share_default
    self.share = false
  end
end
