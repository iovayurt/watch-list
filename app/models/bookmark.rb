class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie
  has_many :lists, through: :movies

  validates :comment, length: { minimum: 6 }
  validates :comment, presence: true
  validates :movie, uniqueness: { scope: :list }
end
