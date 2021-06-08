class BookSerializer < Panko::Serializer
    attributes :id, :author, :title, :genre, :editor, :year, :image
end