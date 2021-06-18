require 'rails_helper'

RSpec.describe Api::BookSuggestionController, type: :controller do
    describe action 'POST #create' do
        before { post :create, params: params}
        context 'Create book suggestion' do
            describe example'with valid parameters' do
                
            end
        end
    end
end