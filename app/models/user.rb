class User < ApplicationRecord
  after_initialize :set_role

  # Guide: https://medium.com/@stacietaylorcima/use-enum-to-represent-user-roles-in-your-database-1cd5424fb311
  enum role: [:client, :admin]

  extend Devise::Models
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  include DeviseTokenAuth::Concerns::User

  has_many :rents

  def set_role
    if self.new_record?
      self.role ||= :client
    end
  end

end
