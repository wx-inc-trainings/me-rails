class Book < ApplicationRecord
  before_save :normalize_title

  extend FriendlyId

  friendly_id :title, use: :slugged

  has_many :rents

  validates :image, :editor, :title, presence: true

  validates :year, numericality: { only_integer: true }, length: { is: 4 }, presence: true

  validates :author, :genre, format: { with: /\A[a-zA-Z]+\W?(\s?|[a-zA-Z]+\W?)*\z/ },
                             presence: true

  scope :book_rents_rankings, -> { joins(:rent).group(:id).order('COUNT(books.id) DESC') }

  def should_generate_new_friendly_id?
    title_changed?
  end

  def normalize_title
    if title.length >= 25
      self.title = title[0..21] + "..."
    else
      self.title = title
    end
  end

end
