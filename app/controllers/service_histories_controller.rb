class ServiceHistoriesController < ApplicationController
  # before_action :set_service_history, only: %i[show edit update destroy]
  def new
    @car = Car.find(params[:car_id])
    @service_history = ServiceHistory.new
  end

  def edit
    @service_history = ServiceHistory.find(params[:id])
  end

  def update
    @service_history = ServiceHistory.find(params[:id])
    # @service_history = service_history.save
    respond_to do |format|
      if @service_history.update(service_history_params)
        format.turbo_stream
        format.html { redirect_to service_histories_path, status: :see_other, notice: "service_history created successfully" }
      else
        format.turbo_stream
        format.html { redirect_to service_histories_path, status: :unprocessable_entity, alert: "Something went wrong when creating service_history" }
      end
    end
  end

  def index
    @car = Car.find(params[:car_id])
    @service_histories = ServiceHistory.where(car_id: @car.id)
  end

  def create
    @car = Car.find(params[:car_id])
    @service_history = ServiceHistory.new(service_history_params)
    @service_history.car = @car
    # @service_history.booking_id = Booking.last.id
    if @service_history.save
      redirect_to car_service_histories_path, notice: "service history added"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @service_histories = ServiceHistory.where(car_id: params[:id])
  end

  def destroy
    @service_history = ServiceHistory.find(params[:id])
    @service_history.destroy
    redirect_to service_histories_path
  end

  private

  def service_history_params
    params.require(:service_history).permit(:service_date, :description, :image)
  end

  # def set_service_history
  #   @car = Car.find(params[:car_id])
  #   @service_history.car = @car
  # end
end
