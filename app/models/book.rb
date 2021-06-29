class Book < ApplicationRecord
  extend FriendlyId

  friendly_id :title, use: :slugged

  has_many :rents

  validates :image, :title, :editor, presence: true

  validates :year, numericality: { only_integer: true }, length: { is: 4 }, presence: true

  validates :author, :genre, format: { with: /\A[a-zA-Z]+\W?(\s?|[a-zA-Z]+\W?)*\z/ },
                             presence: true

  def should_generate_new_friendly_id?
    title_changed?
  end

  scope :book_rents_rankings, -> { joins(:rent).group(:id).order('COUNT(books.id) DESC') }

end
