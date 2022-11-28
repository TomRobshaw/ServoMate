class ServiceHistoriesController < ApplicationController
  def new
    @service_history = Service_history.new
  end

  def edit
    @service_history = Service_history.find(params[:id])
  end

  def update
    @service_history = Service_history.find(params[:id])
    # @service_history = service_history.save
    respond_to do |format|
      if @service_history.update(service_history_params)
        format.turbo_stream
        format.html { redirect_to service_historys_path, status: :see_other, notice: "service_history created successfully" }
      else
        format.turbo_stream
        format.html { redirect_to service_historys_path, status: :unprocessable_entity, alert: "Something went wrong when creating service_history" }
      end
    end
  end

  def index
    @service_historys = Service_history.all
  end

  def create
    @service_history = Service_history.new(service_history_params)
    @service_history.user = current_user
    if @service_history.save
      redirect_to your_service_historys_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @service_history = Service_history.find(params[:id])
  end

  def destroy
    @service_history = Service_history.find(params[:id])
    @service_history.destroy
    redirect_to service_historys_path
  end

  private

  def service_history_params
    params.require(:service_history).permit()
  end
end
