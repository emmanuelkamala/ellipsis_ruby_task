class Link < ApplicationRecord
  validates :lookup_code, presence: true, uniqueness: true
  validates :original_url, presence: true
  validates :original_url, format: { with: URI.regexp, message: "Invalid URL format" }

end
