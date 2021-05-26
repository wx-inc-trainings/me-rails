# frozen_string_literal: true

module Api
  class OpenLibraryController < ApplicationController
    def show
      @book = OpenLibraryService.new(params[:isbn]).get_library
      render json: @book[:result], status: @book[:status?]
    end
  end
end
