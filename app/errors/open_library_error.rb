class OpenLibraryError
  def initialize(isbn)
    @isbn = isbn
  end

  def info_error
    {
      status: 404,
      errors: [
        code_error_book_not_found,
        code_error_isbn
      ]
    }
  end

  private

  def code_error_book_not_found
    { code: '001', message: 'Book not found' }
  end

  def code_error_isbn
    if @isbn.match(/[a-zA-z]/)
      { code: '002', message: 'ISBN cannot be alphabetic' }
    else
      { code: '003', message: 'ISBN does not exist or cannot be found' }
    end
  end

end
