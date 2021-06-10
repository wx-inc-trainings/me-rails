module Api
  class BookController < ApplicationController
    before_action :authenticate_user!

    def index
      render_paginated Book, each_serializer: BookSerializer
    end

    def show
      book = Book.find(params[:id])
      render json: BookSerializer.new.serialize(book).to_json
    end

  end
end
