class BookSuggestion < ApplicationRecord
  belongs_to :user, optional: true
  
  validates :synopsis, :price, presence: false

  validates :link, :title, :editor, presence: true

  validates :year, numericality: { only_integer: true }, length: { is: 4 }, presence: true

  validates :author, format: { with: /\A[a-zA-Z]+\W?(\s?|[a-zA-Z]+\W?)*\z/ },
                             presence: true

end
