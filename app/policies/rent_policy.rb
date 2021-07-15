class RentPolicy < ApplicationPolicy
  def index?
    record.all? { |u| u.user_id == user.id }
  end

  def create?
    record.user_id == user.id
  end

end
