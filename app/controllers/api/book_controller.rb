module Api
  class BookController < ApplicationController
    before_action :authenticate_user!

    rescue_from ActiveRecord::RecordNotFound, with: :book_not_found

    def index
      render_paginated BookReducer.new.apply(params), each_serializer: BookSerializer
    end

    def show
      book = Book.friendly.find_by_friendly_id(params[:id])
      render json: BookSerializer.new.serialize(book).to_json
    end

    private

    def book_not_found
      e = BookError::BookNotFound.new
      render json: Error::BookErrorSerializer.new.serialize(e), status: e.status
    end
  
  end
end
