require 'faker'

def params
  {
    author: Faker::Book.author,
    title: Faker::Book.title,
    editor: Faker::Book.publisher,
    link: Faker::Internet.url,
    year: Faker::Date.between(from: '1000-01-01', to: '2021-12-31').year
  }
end

RSpec.shared_context 'Book Suggestion alone parameters required' do
  let(:book_suggestion_params) { params }
end

RSpec.shared_context 'Book Suggestion param user authenticated' do
  let(:book_suggestion_params) { params.merge({ user_id: user.id }) }
end

RSpec.shared_context 'Book Suggestion param price' do
  let(:book_suggestion_params) { params.merge({ price: Faker::Commerce.price }) }
end

RSpec.shared_context 'Book Suggestion param synopsis' do
  let(:book_suggestion_params) { params.merge({ synopsis: Faker::Lorem.paragraph }) }
end
