require 'rails_helper'
require 'json'

RSpec.describe Api::OpenLibraryController, type: :controller do
  describe action 'GET #show' do
    before(:each) { get :show, params: { isbn: isbn }, format: :json }

    let(:json_open_library_success) do
      file = File.read('./spec/support/features/open_library_success.json')
      JSON.parse(file)
    end

    before do
      @open_library = instance_double(OpenLibraryService)
      allow(@open_library).to receive(:book_info).and_return(json_open_library_success)
      allow(OpenLibraryService).to receive(:new).and_return(@open_library)
    end

    context 'Get book info' do
      describe example 'with valid value' do
        let(:isbn) { 2 }

        it 'status code 200' do
          expect(response).to have_http_status 200
        end

        it 'show book info' do
          book = @open_library.book_info
          current_book = JSON.parse(response.body)

          current_book.each do |key, info|
            expect(info).to eql book[key]
          end
        end
      end

      describe example 'with invalid value' do
        let(:isbn) { 'a' }

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
end
