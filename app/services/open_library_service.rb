class OpenLibraryService

  require 'httparty'

  BASE_URI = Rails.application.credentials.config[:api_open_library][:base_uri]

  def initialize(isbn)
    @isbn = isbn
  end

  def book_info
    response = request_to_open_library

    return { status?: :not_found, result: { message: 'Book not found' } } if response.empty?

    { status?: :ok, result: format_answer_book(response) }
  end

  private

  def request_to_open_library
    query = {
      bibkeys: @isbn,
      format: 'json',
      jscmd: 'data'
    }
    HTTParty.get(BASE_URI, query: query)
  end

  def format_answer_book(response)
    book = response.parsed_response[@isbn]
    {
      ISBN: @isbn,
      title: book['title'],
      subtitle: book['subtitle'],
      number_of_pages: book['number_of_pages'],
      authors: book['authors']
    }
  end
end
