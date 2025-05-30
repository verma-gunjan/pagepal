class CreateRecommendations < ActiveRecord::Migration[8.0]
  def change
    create_table :recommendations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.text :review, limit: 250

      t.timestamps
    end
  end
end
