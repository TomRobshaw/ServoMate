class AddCarIdToServiceHistory < ActiveRecord::Migration[7.0]
  def change
    add_reference :service_histories, :car, foreign_key: true
  end
end
