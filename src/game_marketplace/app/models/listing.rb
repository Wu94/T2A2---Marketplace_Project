class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :platform
  belongs_to :genre
  validates :title, :description, :platform_id, :genre_id, :price, :city, :state, :date_of_listing, presence: true
  # has_one_attached :picture
end
