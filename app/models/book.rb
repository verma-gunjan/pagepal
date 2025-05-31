class Book < ApplicationRecord
    has_many :book_categories
    has_many :categories, through: :book_categories
    has_many :recommendations
    has_one_attached :book_image
end
