# Preview all emails at http://localhost:3000/rails/mailers/rent
class RentPreview < ActionMailer::Preview
  def new_rent
    date = Time.now.to_date
    rent = Rent.new(user_id: 1, book_id: 12, start_date: date, end_date: (date + 3))
    RentMailer.with(rent: rent).new_rent
  end

  def finished_rent
    date = Time.now.to_date
    rent = Rent.new(user_id: 1, book_id: 12, start_date: date, end_date: (date + 3))
    email = rent.user.email
    book_title = rent.book.title
    RentMailer.with(email: email, book_title: book_title).finished_rent
  end

end
