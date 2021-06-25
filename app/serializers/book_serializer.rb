class BookSerializer < Panko::Serializer
  attributes :author, :title, :genre, :editor, :year, :image, :times_rented, :slug 

  def times_rented
    "#{object.rent.count}"
  end
end
