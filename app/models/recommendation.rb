class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :votes
  validates :review, presence: true

  def vote_count
    votes.count
  end
end
