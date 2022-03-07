class Link < ApplicationRecord
  validates :original_url, presence: true

  scope :expires_5_days, lambda { where('created at > ?', 5.days.ago) }

  belongs_to :user

end
