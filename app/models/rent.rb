class Rent < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :start_date, :end_date, presence: true

  scope :active_rents_by_date, lambda { |date|
                                    where('? BETWEEN start_date AND end_date ', date)
                                   .where(returned_at: nil)
                                   .order(end_date: :asc)
                               }

end
