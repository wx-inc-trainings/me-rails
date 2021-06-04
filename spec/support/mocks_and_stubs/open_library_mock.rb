require 'rails_helper'

def open_library_request_success
  stub_request(:get, /openlibrary.org/)
    .with(query: {
            'bibkeys' => /[0-9]/,
            'format' => 'json',
            'jscmd' => 'data'
          },
          headers: { 'Accept' => '*/*' })
    .to_return(status: 200,
               body: File.read('./spec/support/features/open_library_response_success.json'),
               headers: { 'Content-Type': 'application/json' })
end

def open_library_request_not_success
  stub_request(:get, /openlibrary.org/)
    .with(query: {
            'bibkeys' => /[a-zA-Z]/,
            'format' => 'json',
            'jscmd' => 'data'
          },
          headers: { 'Accept' => '*/*' })
    .to_return(status: 200,
               body: '{}',
               headers: { 'Content-Type': 'application/json' })
end
