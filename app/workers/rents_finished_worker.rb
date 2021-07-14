class RentsFinishedWorker
  include Sidekiq::Worker

  def perform
    Rent.rents_finished.each do |rent|
      RentFinishedWorker.perform_async(rent.user.email, rent.book.title)
    end
  end

end
