class RentSerializer < Panko::Serializer
    attributes :id, :from, :to
    has_one :book, serializer: BookSerializer
    has_one :user, serializer: UserSerializer

    def from 
        "#{object.start_date}"
    end

    def to 
        "#{object.end_date}"
    end
end