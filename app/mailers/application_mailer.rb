# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'me-rails@training.com'
  layout 'mailer'

end
