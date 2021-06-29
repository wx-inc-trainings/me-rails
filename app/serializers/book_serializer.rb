class BookSerializer < Panko::Serializer
  attributes :author, :title, :genre, :editor, :year, :image, :times_rented, :slug

  def times_rented
    object.rents.count.to_s
  end

end
