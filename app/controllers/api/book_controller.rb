module Api
  class BookController < ApplicationController
    include Wor::Paginate

    before_action :authenticate_user!

    def index
      render_paginated BookReducer.new.apply(params), each_serializer: BookSerializer
    end

    def show
      book = Book.find(params[:id])
      render json: BookSerializer.new.serialize(book).to_json
    end
  end
end
