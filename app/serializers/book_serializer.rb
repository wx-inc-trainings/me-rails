class BookSerializer < Panko::Serializer
  attributes :author, :title, :genre, :editor, :year, :image, :slug

end
