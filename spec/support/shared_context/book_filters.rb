RSpec.shared_context 'book without filters' do
  let(:title) { nil }
  let(:genre) { nil }
  let(:author) { nil }
end

RSpec.shared_context 'book with filters' do
  let(:book) { create(:book) }
  let(:title) { book.title }
  let(:genre) { book.genre }
  let(:author) { book.author }
end
