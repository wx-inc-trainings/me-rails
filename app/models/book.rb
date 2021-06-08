class Book < ApplicationRecord
  validates :image, :title, :editor, presence: true

  validates :year, numericality: { only_integer: true }, length: { is: 4 }, presence: true

  validates :author, :genre, format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/ }, presence: true
end
