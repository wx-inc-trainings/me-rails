class BookReducer < Rack::Reducer
  def initialize
    super(Book.all,
        ->(author:) { where('lower(author) like ?', "%#{author.downcase}%") },
        ->(genre:) { where('lower(genre) like ?', "%#{genre.downcase}%") },
        ->(title:) { where('lower(title) like ?', "%#{title.downcase}%") }
    )
  end

end
