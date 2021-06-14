require 'rails_helper'
require 'json'

RSpec.describe Api::OpenLibraryController, type: :controller do
  describe action 'GET #show' do
    before { get :show, params: { isbn: isbn }, format: :json }

    let(:json_book_info_success) do
      file = File.read('./spec/support/features/book_info_success.json')
      JSON.parse(file)
    end

    before do
      @book_info_success = instance_double(OpenLibraryService)
      allow(@book_info_success).to receive(:book_info).and_return(json_book_info_success)
      allow(OpenLibraryService).to receive(:new).and_return(@book_info_success)
    end

    context 'Get book info' do
      describe example 'with valid value' do
        let(:isbn) { 2 }

        it 'status code 200' do
          expect(response).to have_http_status :ok
        end

        it 'show book info' do
          book = @book_info_success.book_info

          current_book = JSON.parse(response.body)

          current_book.each do |key, info|
            expect(info).to eql book[key]
          end
        end
      end

      describe example 'with invalid value' do
        let(:isbn) { 'a' }

        let(:list_code_errors) do
          file = File.read('./spec/support/features/list_code_errors.json')
          JSON.parse(file)
        end

        it 'status code 404' do
          expect(response).to have_http_status :not_found
        end

        it 'show message error' do
          errors = JSON.parse(response.body)['errors']
          errors.each do |error|
            expect(error['message']).to eql list_code_errors[error['code']]
          end
        end
      end
    end
  end
end
