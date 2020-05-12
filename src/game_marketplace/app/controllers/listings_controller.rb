class ListingsController < ApplicationController
    before_action :authenticate_user!
    def index
        @listings = Listing.all
    end

    def show
        #stripe
    end

    def new 
        @listings = Listing.new
    end

    def create
        @listings = current_user.listings.create(listing_params)
        if @listing.errors.any?
            render "new"
        else
            redirect_to listings_path
        end
    end

    def edit

    end

    def update
        @listing = Listing.update(params["id"], listing_params)
        if @listing.errors.any?
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
        @platform = Platform.all
        @genres = Genre.all
    end

    def listing_params
        params.require(:listing).permit(:title, :description, :platform_id, :genre_id, :price, :city, :state, :date_of_listing, :picture)
    end
end
