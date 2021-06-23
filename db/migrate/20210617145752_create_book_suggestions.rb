class CreateBookSuggestions < ActiveRecord::Migration[6.1]
  def change
    create_table :book_suggestions do |t|
      t.string :synopsis, null: true
      t.float :price, null: true, precision: 8, scale: 2
      t.string :author, null: false
      t.string :title, null: false
      t.string :link, null: false
      t.string :editor, null: false
      t.string :year, null: false
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
