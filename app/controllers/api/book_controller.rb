class Api::BookController < ApplicationController
  def index
    book = Book.all
    render json: Panko::ArraySerializer.new(book, each_serializer: BookSerializer).to_json
  end

  def show
  end
end
