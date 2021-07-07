class RentMailer < ApplicationMailer
  default from: Rails.application.secrets.email_notify 

  def new_rent
    @rent = params[:rent]
    @book = @rent.book
    email = @rent.user.email
    mail(to: email, subject: 'You got a new rent!')
  end

end
