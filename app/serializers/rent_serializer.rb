class RentSerializer < Panko::Serializer
  attributes :id
  
  aliases start_date: :from, end_date: :to, returned_at: :returned_at

  has_one :book, serializer: BookSerializer
  has_one :user, serializer: UserSerializer

end
