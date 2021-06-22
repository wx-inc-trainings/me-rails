require 'faker'

FactoryBot.define do
  factory :book_suggestion do
    author { Faker::Book.author }
    title { Faker::Book.title }
    editor { Faker::Book.publisher }
    link { Faker::Internet.url }
    year { Faker::Date.between(from: '1000-01-01', to: '2021-12-31').year }
    synopsis { Faker::Lorem.paragraph }
    price { Faker::Commerce.price }
  end
end
