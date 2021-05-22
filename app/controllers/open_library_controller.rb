# frozen_string_literal: true

class OpenLibraryController < ApplicationController
  def index
    @book = AppServices::OpenLibraryService.get_library(params['ISBN'])
    render json: @book[:result], status: @book[:status?]
  end
end
