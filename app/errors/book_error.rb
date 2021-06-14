module BookError
  class BookNotFound
    attr_reader :status, :code, :message

    def initialize(message = nil)
      @status = :not_found
      @code = '001'
      @message = message || 'Book not found'
    end

  end
end
