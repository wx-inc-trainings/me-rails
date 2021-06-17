RSpec.shared_examples 'status 200 and paginated' do
  it 'responds with 200 status' do
    expect(response).to have_http_status 200
  end

  it 'response is paginated' do
    expect(response).to be_paginated
  end
end
