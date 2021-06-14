module BookError
  class BookNotFound
    attr_reader :status, :code, :message

    def initialize(message = nil)
      @status = 404
      @code = '001'
      @message = message || 'Book not found'
    end

  end
end
