class Host::ListingsController < ApplicationController
  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_create_paramms)
    if @listing.save
      redirect_to host_listing_path(@listing)
    else
      flash.now[:errors] = @listing.errors.full_messages
      render :new
    end
  end

  def edit
    @listing = current_user.listings.find(params[:id])
  end

  def index
    @listings = current_user.listings.all
  end


  def update
    @listing = current_user.listings.find(params[:id])
    if @listing.update(listing_update_paramms)
      redirect_to host_listing_path(@listing)
    else
      flash.now[:errors] = @listing.errors.full_messages
      render :edit
    end
  end

  def show
    @listing = current_user.listings.find(params[:id])
  end

  def destroy
    @listing = current_user.listings.find(params[:id])
    @listing.update(status: :archived)
    redirect_to host_listings_path
  end


  private

  def listing_create_paramms
    params.require(:listing).permit(
    :title, :about, :max_guests, :address_line1, :address_line2, :city, :state, :postal_code, :country, :lat, :lng)
  end


  def listing_update_paramms
    params.require(:listing).permit(
    :title, :about, :max_guests, :status)
  end

end
