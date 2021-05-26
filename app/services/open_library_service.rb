# frozen_string_literal: true

class OpenLibraryService
  require 'HTTParty'

  BASE_URI = OPEN_LIBRARY['base_uri']

  def initialize(isbn)
    @isbn = isbn
  end

  def get_library
    response = request_to_open_library
    if response.empty?
      { status?: :bad_request, result: { message: 'Book not found' } }
    else
      { status?: :ok, result: format_answer_book(response) }
    end
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
      {
        ISBN: @isbn,
        title: response.parsed_response[@isbn]['title'],
        subtitle: response.parsed_response[@isbn]['subtitle'],
        number_of_pages: response.parsed_response[@isbn]['number_of_pages'],
        authors: response.parsed_response[@isbn]['authors']
      }
    end
end
