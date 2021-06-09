class Book < ApplicationRecord
  validates :image, :title, :editor, presence: true

  validates :year, numericality: { only_integer: true }, length: { is: 4 }, presence: true

  validates :author, :genre, format: { with: /\A[a-zA-Z]+\W?(\s?|[a-zA-Z]+\W?)*\z/ }, presence: true
end
