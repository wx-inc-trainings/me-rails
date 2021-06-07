require 'rails_helper'
require_relative '../support/mocks_and_stubs/open_library_mock'

RSpec.describe OpenLibraryService, type: :service do
  describe 'GET #book_info' do
    let(:open_library_base_uri) do
      Rails.application.credentials.config[:api_open_library][:base_uri]
    end

    before do
      uri = URI(open_library_base_uri)
      uri.query = "bibkeys=#{isbn}&format=json&jscmd=data"
      @response = Net::HTTP.get(uri)
    end

    context 'with valid isbn' do
      let(:json_book_info_success) do
        file = File.read('./spec/support/features/book_info_success.json')
        JSON.parse(file)
      end

      let(:isbn) { '2' }

      subject(:book_response) { described_class.new(isbn).book_info }

      before do
        open_library_request_success
      end

      it 'makes an external request' do
        expect(@response).to have_requested(:get, open_library_base_uri)
          .with(query: {
                  'bibkeys' => isbn,
                  'format' => 'json',
                  'jscmd' => 'data'
                })
      end

      it 'status :ok' do
        expect(book_response[:status?]).to eq :ok
      end

      it 'show book info' do
        book_info = book_response[:result]
        book_info.each do |key, info|
          expect(info).to eq json_book_info_success[key.to_s]
        end
      end
    end

    context 'with invalid isbn' do
      let(:list_code_errors) do
        file = File.read('./spec/support/features/list_code_errors.json')
        JSON.parse(file)
      end

      let(:isbn) { 'abc' }

      subject(:book_response) { described_class.new(isbn).book_info }

      before do
        open_library_request_not_success
      end

      it 'makes an external request' do
        expect(@response).to have_requested(:get, open_library_base_uri)
          .with(query: {
                  'bibkeys' => isbn,
                  'format' => 'json',
                  'jscmd' => 'data'
                })
      end

      it 'status :not_found' do
        expect(book_response[:status?]).to eq :not_found
      end

      it 'show errors' do
        errors = book_response[:result][:errors]
        errors.each do |error|
          expect(error[:message]).to eql list_code_errors[error[:code]]
        end
      end
    end
  end
end
