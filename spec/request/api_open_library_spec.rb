# frozen_string_literal: true

require 'rails_helper'
require 'json'

RSpec.describe 'Request to /api/open_library/:isbn', type: :request do
  describe 'when using ISBN:2' do
    before { get '/api/open_library/2' }

    let(:json_isbn_2_result) do
      file = File.read('./spec/support/features/open_library_isbn_2.json')
      JSON.parse(file)
    end

    before do
      @open_library = instance_double(OpenLibraryService)
      allow(@open_library).to receive(:book_info).and_return(json_isbn_2_result)
      allow(OpenLibraryService).to receive(:new).and_return(@open_library)
    end

    context 'GET api/open_library/2' do
      it 'status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'show book info' do
        book = @open_library.book_info
        current_book = JSON.parse(response.body)

        current_book.each do |key, info|
          expect(info).to eql book[key]
        end
      end
    end
  end

  describe 'when using ISBN:a' do
    before { get '/api/open_library/a' }

    context 'GET /api/open_library/a' do
      it 'status code 404' do
        expect(response).to have_http_status 404
      end

      it 'show message error' do
        message = JSON.parse(response.body)['message']
        expect(message).to eql 'Book not found'
      end
    end
  end
end
