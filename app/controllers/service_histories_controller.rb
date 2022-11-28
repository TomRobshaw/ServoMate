class ServiceHistoriesController < ApplicationController
  def index
    @service_histories = Service_history.all
  end

end

# Create
# update
# read
# delete
