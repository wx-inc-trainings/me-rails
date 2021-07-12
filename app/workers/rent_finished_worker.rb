require 'sidekiq-scheduler'

class RentFinishedWorker
  include Sidekiq::Worker

  def perform(email, book_title)
    RentMailer.with(email: email, book_title: book_title).finished_rent.deliver_later
  end
end
