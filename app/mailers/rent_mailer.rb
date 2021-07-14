class RentMailer < ApplicationMailer
  default from: Rails.application.secrets.email_notify

  def new_rent
    @rent = params[:rent]
    @book = @rent.book
    email = @rent.user.email
    mail(to: email, subject: t('new_rent_mail.subject'))
  end

  def finished_rent
    @book_title = params[:book_title]
    mail(to: params[:email], subject: t('finished_rent_mail.subject'))
  end

end
