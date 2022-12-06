class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]
  def index
    @cars = Car.all
  end

  def change_status
    @car = Car.find(params[:id])
  end

  def show
    @car = Car.find(params[:id])
    @countdown = tyres_countdown
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user_id = current_user.id
    @car.tyres_expired = 96_000
    @car.brakes_expired = 80_000
    @car.oil_and_filter_expired = 15_000
    @car.spark_plugs_and_ignition_expired = 30_000
    @car.tyres = 0
    @car.brakes = 0
    @car.spark_plugs_and_ignition = 0
    @car.oil_and_filter = 0

    if @car.save
      redirect_to cars_path(@car), notice: 'Car was successfully added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    redirect_to car_path(@car)
  end

  def tyres_expired
    @car.tyres_expired = 96_000
  end

  def tyres_countdown
    @car.tyres_countdown = @car.tyres_expired - (@car.kilometers - @car.tyres)
  end

  def tyres_percentage
    @car.tyres_percentage = (@car.tyres / @car.tyres_expired).to_f * 100
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:make, :model, :year, :kilometers, :image)
  end
end
