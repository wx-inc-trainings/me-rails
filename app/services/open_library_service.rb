class OpenLibraryService
  require 'httparty'

  BASE_URI = Rails.application.credentials.config[:api_open_library][:base_uri]

  def initialize(isbn)
    @isbn = isbn
  end

  def book_info
    response = request_to_open_library

    if response.empty?
      return { status?: :not_found,
               result: OpenLibraryError.new(@isbn).info_error }
    end

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
      ISBN: @isbn
    }.merge(book.slice('title', 'subtitle', 'number_of_pages', 'authors'))
  end
end
