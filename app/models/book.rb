class Book < ApplicationRecord
  validates_presence_of :genre, :image, :author, :title, :editor, :year

  validates_format_of :year, with: /\A\d+\z/

  validates_length_of :year, maximum: 4
  validates :author, :genre, format: { with: /\A[a-zA-Z]+\W?(\s?|[a-zA-Z]+\W?)*\z/ },
                             presence: true
end
