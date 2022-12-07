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
    @tyres_countdown = tyres_countdown
    @tyres_percentage = tyres_percentage
    @tyres_difference = tyres_difference
    @brakes_countdown = brakes_countdown
    @brakes_percentage = brakes_percentage
    @brakes_difference = brakes_difference
    @oil_and_filter_countdown = oil_and_filter_countdown
    @oil_and_filter_percentage = oil_and_filter_percentage
    @oil_and_filter_difference = oil_and_filter_difference
    @spark_plugs_and_ignition_countdown = spark_plugs_and_ignition_countdown
    @spark_plugs_and_ignition_percentage = spark_plugs_and_ignition_percentage
    @spark_plugs_and_ignition_difference = spark_plugs_and_ignition_difference
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user_id = current_user.id
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

  def tyres_countdown
    set_car
    @car.tyres_expired - (@car.kilometers - @car.tyres)
  end

  def tyres_difference
    set_car
    @car.kilometers - @car.tyres
  end

  def tyres_percentage
    set_car
    tyres_difference / @car.tyres_expired.to_f * 100
  end

  def brakes_countdown
    set_car
    @car.brakes_expired - (@car.kilometers - @car.brakes)
  end

  def brakes_difference
    set_car
    @car.kilometers - @car.brakes
  end

  def brakes_percentage
    set_car
    brakes_difference / @car.brakes_expired.to_f * 100
  end

  def oil_and_filter_countdown
    set_car
    @car.oil_and_filter_expired - (@car.kilometers - @car.oil_and_filter)
  end

  def oil_and_filter_difference
    set_car
    @car.kilometers - @car.oil_and_filter
  end

  def oil_and_filter_percentage
    set_car
    oil_and_filter_difference / @car.oil_and_filter_expired.to_f * 100
  end

  def spark_plugs_and_ignition_countdown
    set_car
    @car.spark_plugs_and_ignition_expired - (@car.kilometers - @car.spark_plugs_and_ignition)
  end

  def spark_plugs_and_ignition_difference
    set_car
    @car.kilometers - @car.spark_plugs_and_ignition
  end

  def spark_plugs_and_ignition_percentage
    set_car
    spark_plugs_and_ignition_difference / @car.spark_plugs_and_ignition_expired.to_f * 100
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:make, :model, :year, :kilometers, :image, :tyres, :oil_and_filter, :spark_plugs_and_ignition, :brakes)
  end
end
