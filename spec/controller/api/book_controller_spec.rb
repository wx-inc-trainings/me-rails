require 'rails_helper'

RSpec.describe Api::V1::BookController, type: :controller do
  include_context 'Authenticated User'

  describe action 'GET #index' do
    let!(:books) { create_list(:book, 5) }

    before { get :index, params: { title: title, genre: genre, author: author } }

    context 'When fetching all books ' do
      describe example 'without filter' do
        include_context 'book without filters'

        include_examples 'status 200 and paginated'

        it 'response with the books json' do
          expected = Panko::ArraySerializer.new(books,
                                                each_serializer: BookSerializer).to_json
          expect(response.body.to_json) =~ JSON.parse(expected)
        end
      end

      describe example 'with filter' do
        include_context 'book with filters'

        include_examples 'status 200 and paginated'

        it 'response with the books filtered json' do
          expected = BookSerializer.new.serialize(book).to_json
          expect(response.body.to_json) =~ JSON.parse(expected)
        end
      end
    end
  end

  describe action 'GET #show' do
    let!(:book) { create(:book) }

    before { get :show, params: { slug: slug } }

    context 'When fetching a book' do
      describe example 'with valid value' do
        let(:slug) { book.slug }

        it 'responds with 200 status' do
          expect(response).to have_http_status 200
        end

        it 'responses with the book json' do
          expect(response.body).to eq BookSerializer.new.serialize(book).to_json
        end
      end

      describe example 'with invalid value' do
        let(:slug) { Faker::Internet.slug }

        it 'responds with 404 status' do
          expect(response).to have_http_status 404
        end

        it 'reponse with error message json' do
          expected = { "error": "can't find record with friendly id: #{slug}" }.to_json
          expect(response.body.to_json) =~ JSON.parse(expected)
        end
      end
    end
  end
end
