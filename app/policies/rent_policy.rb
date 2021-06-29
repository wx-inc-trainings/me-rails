class RentPolicy < ApplicationPolicy
    def index?
        record.first.user_id == user.id
    end
    
    def create?
        record.user_id == user.id
    end
    
end