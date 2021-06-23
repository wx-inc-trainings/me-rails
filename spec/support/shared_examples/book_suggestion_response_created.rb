RSpec.shared_examples 'status 201 and created new book suggestion' do
  it 'creates a new book suggestion' do
    expect(BookSuggestion.count).to be >= 1
  end

  it 'respond with 201 status' do
    expect(response).to have_http_status 201
  end
end
