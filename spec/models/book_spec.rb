require 'rails_helper'

RSpec.describe Book, type: :model do
  subject(:book) { build(:book) }
  
  it { is_expected.to be_valid }
  
  describe 'Validations' do
    attributes = [:genre, :author, :image, :title, :editor, :year] 
    
    context 'when all attributes are present' do
      attributes.each do |attribute|
        it { is_expected.to validate_presence_of(attribute) }
      end
    end
    
    context 'when not valid' do 
      attributes.each do |attribute|
        it 'without #{attribute}' do
          book[attribute] = nil
          expect(book).to_not be_valid
        end
      end
    end
    
  end
end
