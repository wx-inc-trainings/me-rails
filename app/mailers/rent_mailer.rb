class RentMailer < ApplicationMailer
    def new_mail
        @rent = params[:rent]
        @user = @rent.user
        @book = @rent.book
        mail(to: "mailtest@test.com", subject: "You got a new order!")
    end
end
