class Listing < ApplicationRecord
  belongs_to :platform
  belongs_to :genre
  belongs_to :user
  validates :title, :description, :platform_id, :genre_id, :price, :city, :state, :date_of_listing, presence: true
end
