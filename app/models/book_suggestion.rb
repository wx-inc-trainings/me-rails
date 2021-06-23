class BookSuggestion < ApplicationRecord
  belongs_to :user, optional: true

  validates :synopsis, presence: false

  validates :price, format: { with: /\A\d+??(?:\.\d{0,2})?\z/ },
                    numericality: { greater_than: 0, only_float: true },
                    presence: false, allow_blank: true

  validates :title, :editor, presence: true

  validates :link, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) },
                   presence: true

  validates :year, numericality: { only_integer: true }, length: { minimum: 1, maximum: 4 },
                   presence: true

  validates :author, format: { with: /\A[a-zA-Z]+\W?(\s?|[a-zA-Z]+\W?)*\z/ },
                     presence: true

end
