class Movie < ApplicationRecord
  # has_many :bookmarks, dependent: :restrict_with_error
  has_many :bookmarks
  # has_many :lists

  validates :title, :overview, presence: true
  validates :title, uniqueness: true
end
