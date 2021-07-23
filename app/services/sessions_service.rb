class SessionsService
  require 'httparty'

  LOGIN_BASE_URI = "#{Rails.application.secrets.base_uri}/auth/sign_in".freeze

  def initialize(email, password)
    @response = login(email, password)
  end

  def status_code
    @response.code
  end

  def response
    @response.parsed_response
  end

  private

  def login(email, password)
    HTTParty.post(LOGIN_BASE_URI, body: { email: email, password: password })
  end

end
