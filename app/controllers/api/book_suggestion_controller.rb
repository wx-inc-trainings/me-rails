module Api
  class BookSuggestionController < ApplicationController
    def create
      User.find(params[:user_id]) if params[:user_id].present?
      BookSuggestion.create!(book_suggestion_params)
      render json: { message: 'Book Suggestion created' }, status: :created
    end

    private

    def book_suggestion_params
      params.permit(:title, :author, :year, :editor, :link, :user_id, :price, :synopsis)
    end

  end
end
