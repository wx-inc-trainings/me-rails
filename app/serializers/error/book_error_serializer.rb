module Error
  class BookErrorSerializer < Panko::Serializer
    attributes :status, :errors

    def errors
      [{ message: object.message, code: object.code }]
    end

  end
end
