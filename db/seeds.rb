require 'faker'

1000.times do 
    Book.create(
        genre: Faker::Book.genre, 
        author:  Faker::Book.author, 
        image:  Faker::LoremFlickr.image(size: '50x60'),  #=> Url image
        title:  Faker::Book.title,
        editor:  Faker::Book.publisher, 
        year:  Faker::Date.between(from: '1000-01-01', to: '2021-12-31').year 
    )
end