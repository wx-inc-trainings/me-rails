# frozen_string_literal: true

class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  include DeviseTokenAuth::Concerns::User
end
