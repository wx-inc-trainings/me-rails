module Api
  module V1
    class BookSuggestionController < ApplicationController
      def create
        return user_not_found if params[:user_id].present? && !User.exists?(params[:user_id])

        BookSuggestion.create!(book_suggestion_params)
        head :created
      end

      private

      def book_suggestion_params
        params.permit(:title, :author, :year, :editor, :link, :user_id, :price, :synopsis)
      end

      def user_not_found
        render json: { error: 'User not found' }, status: :unprocessable_entity
      end

    end
  end
end
