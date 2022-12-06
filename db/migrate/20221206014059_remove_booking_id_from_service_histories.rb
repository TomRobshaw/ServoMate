class RemoveBookingIdFromServiceHistories < ActiveRecord::Migration[7.0]
  def change
    remove_column :service_histories, :booking_id
  end
end
