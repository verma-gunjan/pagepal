class Category < ApplicationRecord
    has_many :book_categories
    has_many :books, through: :book_categories
    validates :title, presence: true
end
