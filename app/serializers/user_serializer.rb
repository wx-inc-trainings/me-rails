class UserSerializer < Panko::Serializer
    attributes :id, :first_name, :last_name, :email, :rents_counter

    def rents_counter
        "#{object.rent.count}"
    end
end