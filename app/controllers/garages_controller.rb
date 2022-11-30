class GaragesController < ApplicationController
  def new
    @garage = Garage.new
  end

  def edit
    @garage = Garage.find(params[:id])
  end

  def update
    @garage = Garage.find(params[:id])
    # @garage = garage.save
    respond_to do |format|
      if @garage.update(garage_params)
        format.turbo_stream
        format.html { redirect_to garages_path, status: :see_other, notice: "garage created successfully" }
      else
        format.turbo_stream
        format.html { redirect_to garages_path, status: :unprocessable_entity, alert: "Something went wrong when creating garage" }
      end
    end
  end

  def index
    @garages = Garage.all

    if params[:query].present?
      @garages = @garages.where("name ILIKE ?", "%#{params[:query]}%")
    end
    @markers = @garages.geocoded.map do |garage|
      {
        lat: garage.latitude,
        lng: garage.longitude,
        info_window: render_to_string(partial: "info_window", locals: {garage: garage}),
        image_url: helpers.asset_url("Workshop-21")
      }
    end
  end

  def create
    @garage = Garage.new(garage_params)
    @garage.user = current_user
    if @garage.save
      redirect_to your_garages_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @garage = Garage.find(params[:id])
    # @listing = Listing.find(params[:id])
    # @garage.listing = @garage
  end

  def destroy
    @garage = Garage.find(params[:id])
    @garage.destroy
    redirect_to garages_path
  end

  private

  # private params need work and need to find out why views arnt auto populating
  def garage_params
    params.require(:garage).permit(:name, :address, :latitude, :longitude)
  end
end
