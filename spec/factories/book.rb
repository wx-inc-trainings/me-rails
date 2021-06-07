FactoryBot.define do
  factory :book do
    genre { 'Suspenso' }
    author { 'George Orwell' }
    image { 'portada.jpg' }
    title { '1984' }
    editor { 'Editorial' }
    year { '2000' }
  end
end
