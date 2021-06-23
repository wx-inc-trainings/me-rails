require 'rails_helper'

RSpec.describe BookSuggestion, type: :model do
  subject(:book_suggestion) { build(:book_suggestion) }

  describe 'Validations' do
    it { is_expected.to be_valid }

    describe 'Presence' do
      attributes_required = %i[author title editor year link]

      context 'when all attributes required are present' do
        attributes_required.each do |attribute|
          it { is_expected.to validate_presence_of(attribute) }
        end
      end

      context 'when not valid' do
        attributes_required.each do |attribute|
          it "without #{attribute}" do
            book_suggestion[attribute] = nil
            expect(book_suggestion).not_to be_valid
          end
        end
      end
    end

    describe 'Format' do
      context 'when .author' do
        it 'is alphabetic' do
          book_suggestion.author = 'George Orwell'
          expect(book_suggestion).to be_valid
        end

        it 'is not alphabetic' do
          book_suggestion.author = 'Nro1'
          expect(book_suggestion).not_to be_valid
        end
      end

      context 'when .year' do
        it 'is numeric and length < 5' do
          book_suggestion.year = '2000'
          expect(book_suggestion).to be_valid
        end

        it 'is numeric and length > 4' do
          book_suggestion.year = '20001'
          expect(book_suggestion).not_to be_valid
        end

        it 'is not numeric' do
          book_suggestion.year = 'Nro3'
          expect(book_suggestion).not_to be_valid
        end
      end

      context 'When .price' do
        it 'is float numeric' do
          book_suggestion.price = 100.55
          expect(book_suggestion).to be_valid
        end

        it 'is not numeric' do
          book_suggestion.price = 'price'
          expect(book_suggestion).not_to be_valid
        end
      end

      context 'When .link' do
        it 'is url' do
          book_suggestion.link = 'https://google.com'
          expect(book_suggestion).to be_valid
        end

        it 'is not url' do
          book_suggestion.link = 'url'
          expect(book_suggestion).not_to be_valid
        end
      end
    end
  end
  
end
