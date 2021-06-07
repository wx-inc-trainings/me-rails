class Book < ApplicationRecord
    validates_presence_of :genre, :image, :author, :title, :editor, :year
end
