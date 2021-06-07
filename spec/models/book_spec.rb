require 'rails_helper'

RSpec.describe Book, type: :model do
  subject(:book) { build(:book) }

  describe 'Validations' do
    it { is_expected.to be_valid }

    describe 'Presence' do
      attributes = %i[genre author image title editor year]

      context 'when all attributes are present' do
        attributes.each do |attribute|
          it { is_expected.to validate_presence_of(attribute) }
        end
      end

      context 'when not valid' do
        attributes.each do |attribute|
          it "without #{attribute}" do
            book[attribute] = nil
            expect(book).to_not be_valid
          end
        end
      end
    end

    describe 'Format' do
      context 'when .author' do
        it 'is alphabetic' do
          book.author = 'George Orwell'
          expect(book).to be_valid
        end

        it 'is not alphabetic' do
          book.author = 'Nro1'
          expect(book).to_not be_valid
        end
      end

      context 'when .genre' do
        it 'is alphabetic' do
          book.genre = 'Suspenso'
          expect(book).to be_valid
        end

        it 'is not alphabetic' do
          book.genre = 'Nro2'
          expect(book).to_not be_valid
        end
      end

      context 'when .year' do
        it 'is numeric and length < 5' do
          book.year = '2000'
          expect(book).to be_valid
        end

        it 'is numeric and length > 4' do
          book.year = '20001'
          expect(book).to_not be_valid
        end

        it 'is not numeric' do
          book.year = 'Nro3'
          expect(book).to_not be_valid
        end
      end
    end
  end
end
