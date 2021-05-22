# frozen_string_literal: true

module AppServices
  class OpenLibraryService
    require 'HTTParty'

    BASE_URI = 'https://openlibrary.org/api/books'

    def self.get_library(isbn)
      response = request_to_open_library(isbn)
      if response.empty?
        { status?: :bad_request, result: { message: 'Book not found' } }
      else
        { status?: :ok, result: format_answer_book(isbn, response) }
      end
    end

    def self.request_to_open_library(isbn)
      query = {
        bibkeys: isbn,
        format: 'json',
        jscmd: 'data'
      }
      HTTParty.get(BASE_URI, query: query)
    end

    def self.format_answer_book(isbn, response)
      {
        ISBN: isbn,
        title: response.parsed_response['ISBN:0385472579']['title'],
        subtitle: response.parsed_response['ISBN:0385472579']['subtitle'],
        number_of_pages: response.parsed_response['ISBN:0385472579']['number_of_pages'],
        authors: response.parsed_response['ISBN:0385472579']['authors']
      }
    end
  end
end
