class Book < ApplicationRecord
  validates_presence_of :genre, :image, :author, :title, :editor, :year

  validates_format_of :year, with: /\A\d+\z/
  validates_format_of :author, :genre, with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/

  validates_length_of :year, maximum: 4
end
