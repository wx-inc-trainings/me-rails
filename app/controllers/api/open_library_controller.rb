# frozen_string_literal: true

class Api::OpenLibraryController < ApplicationController
  def show
    @book = OpenLibraryService.get_library(params[:ISBN])
    render json: @book[:result], status: @book[:status?]
  end
end
