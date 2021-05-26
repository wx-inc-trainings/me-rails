# frozen_string_literal: true

module Api
  class OpenLibraryController < ApplicationController
    def show
      @book = OpenLibraryService.get_library(params[:ISBN])
      render json: @book[:result], status: @book[:status?]
    end
  end
end
