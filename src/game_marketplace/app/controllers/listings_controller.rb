class ListingsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_listing, only: [:show]
    before_action :set_user_listing, only: [:edit, :update, :destroy]

    def index
        @listings = Listing.all
    end

    def show
        set_listing
    end

    def new 
        set_platforms_genres
        @listing = Listing.new
    end

    def create
        @listing = current_user.listings.create(listing_params)
        if @listing.errors.any?
            set_platforms_genres
            render "new"
        else
            redirect_to listings_path
        end
    end

    def edit
        set_platforms_genres
    end

    def update
        @listing = Listing.update(params["id"], listing_params)
        if @listing.errors.any?
            set_platforms_genres
            render "edit"
        else
            redirect_to listings_path
        end
    end

    def destroy 
        Listing.find(params["id"]).destroy
        redirect_to listings_path
    end

    private

    def set_listing
        @listing = Listing.find(params[:id])
    end

    def set_user_listing
        @listing = current_user.listings.find_by_id(params[:id])

        if @listing == nil
            redirect_to listings_path
        end
    end

    def set_platforms_genres
        @platforms = Platform.all
        @genres = Genre.all
    end

    def listing_params
        params.require(:listing).permit(:title, :description, :platform_id, :genre_id, :price, :city, :state, :date_of_listing)
    end
end
