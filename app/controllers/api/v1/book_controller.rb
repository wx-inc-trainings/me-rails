module Api
  module V1
    class BookController < ApplicationController
      before_action :authenticate_user!

      def index
        render_paginated BookReducer.new.apply(params), each_serializer: BookSerializer
      end

      def show
        book = Book.friendly.find_by_friendly_id(params[:slug])
        render json: BookSerializer.new.serialize(book).to_json
      end

    end
  end
end
