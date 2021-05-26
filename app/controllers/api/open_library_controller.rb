# frozen_string_literal: true

module Api
  class OpenLibraryController < ApplicationController
    def show
      @book = OpenLibraryService.new(params[:isbn]).book_info
      render json: @book[:result], status: @book[:status?]
    end
  end
end
