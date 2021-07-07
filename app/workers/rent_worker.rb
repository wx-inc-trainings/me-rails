class RentWorker
  include Sidekiq::Worker

  def perform(id_rent)
    rent = Rent.find(id_rent)
    RentMailer.with(rent: rent).new_rent.deliver_later
  end

end
