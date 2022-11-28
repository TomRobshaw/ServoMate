class BookingsController < ApplicationController
  # value
  # status
  def new
    @booking = Booking.new
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    # @booking = booking.save
    respond_to do |format|
      if @booking.update(booking_params)
        format.turbo_stream
        format.html { redirect_to bookings_path, status: :see_other, notice: "booking created successfully" }
      else
        format.turbo_stream
        format.html { redirect_to bookings_path, status: :unprocessable_entity, alert: "Something went wrong when creating booking" }
      end
    end
  end

  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to your_bookings_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
    # @listing = Listing.find(params[:id])
    # @booking.listing = @booking
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  # private params need work and need to find out why views arnt auto populating
  def booking_params
    params.require(:booking).permit(:name, :address)
  end
end
