class AddCarPartsExpiryColumnToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :tyres_expired, :integer
    add_column :cars, :brakes_expired, :integer
    add_column :cars, :oil_and_filter_expired, :integer
    add_column :cars, :spark_plugs_and_ignition_expired, :integer
  end
end
