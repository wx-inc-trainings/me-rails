# Preview all emails at http://localhost:3000/rails/mailers/rent
class RentPreview < ActionMailer::Preview
    def new_mail
        date = Time.now.to_date
        rent = Rent.new(user_id: 1, book_id: 1, start_date: date, end_date: ( date + 3 ))
        RentMailer.with(rent: rent).new_mail
    end
end
