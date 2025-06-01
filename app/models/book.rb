class Book < ApplicationRecord
    has_many :book_categories
    has_many :categories, through: :book_categories
    has_many :recommendations
    has_one_attached :book_image
    validates :title, :author, presence: true
    validate :must_have_at_least_one_category

    def must_have_at_least_one_category
      if categories.empty?
        errors.add(:categories, "must have at least one category")
      end
    end
end
