class RentMailer < ApplicationMailer
  def new_mail
    @rent = params(:rent)
    mail(to: 'mailtest@test.com', subject: 'You got a new order!')
  end

end
