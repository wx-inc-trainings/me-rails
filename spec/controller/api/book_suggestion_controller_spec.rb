require 'rails_helper'

RSpec.describe Api::V1::BookSuggestionController, type: :controller do
  describe action 'POST #create' do
    before { post :create, params: book_suggestion_params }

    context 'When create valid book suggestion' do
      describe example 'alone with valid parameters required' do
        include_context 'Book Suggestion alone parameters required'
        include_examples 'status 201 and created new book suggestion'
      end

      describe example 'with valid authenticated user' do
        include_context 'Authenticated User'
        include_context 'Book Suggestion param user authenticated'
        include_examples 'status 201 and created new book suggestion'
      end

      describe example 'with valid price param' do
        include_context 'Book Suggestion param price'
        include_examples 'status 201 and created new book suggestion'
      end

      describe example 'with valid synopsis param' do
        include_context 'Book Suggestion param synopsis'
        include_examples 'status 201 and created new book suggestion'
      end
    end

    context 'When create invalid book suggestion' do
      describe example 'without parameters required' do
        let(:book_suggestion_params) { nil }
        let(:book_suggestion_errors) do
          file = File.read('./spec/support/features/book_suggestion_errors.json')
          JSON.parse(file)
        end

        it 'responds with 422 status' do
          expect(response).to have_http_status 422
        end

        it 'response with errors json' do
          expect(response.body.to_json) =~ book_suggestion_errors
        end
      end

      describe example 'with invalid param' do
        let(:book_suggestion_params) { { lorem: 'lorem' } }

        it 'responds with 400 status' do
          expect(response).to have_http_status 400
        end

        it 'response with error json' do
          expected = { "error": 'found unpermitted parameters:' }.to_json
          expect(response.body.to_json) =~ JSON.parse(expected)
        end
      end

      describe example 'with invalid param user_id' do
        let(:book_suggestion_params) { { user_id: 'a' } }

        it 'responds with 404 status' do
          expect(response).to have_http_status 404
        end

        it 'response with error json' do
          expeceted = { error: "Couldn't find user with" }.to_json
          expect(response.body.to_json) =~ JSON.parse(expeceted)
        end
      end
    end
  end
end
