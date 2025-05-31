class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :recommendation
  validates :user_id, uniqueness: { scope: :recommendation_id }
  after_create_commit do
    broadcast_replace_to "recommendations",
      target: "vote_count_#{recommendation.id}",
      partial: "recommendations/vote_count",
      locals: { recommendation: recommendation }
  end
end
