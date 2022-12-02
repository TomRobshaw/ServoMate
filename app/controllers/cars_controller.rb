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

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:make, :model, :year, :kilometers, :image)
  end
end
