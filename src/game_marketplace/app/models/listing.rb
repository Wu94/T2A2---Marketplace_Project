class Listing < AppicationRecord
    belong_to :genre
    belong_to :platform
    validates :title, :description, :platform_id, :genre_id, :price, :city, :state, :date_of_listing, presence: true
    has_one_attached :picture
    belongs_to :user
end