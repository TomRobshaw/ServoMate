class AddDefaultValuesToCars < ActiveRecord::Migration[7.0]
  def change
    change_column :cars, :tyres, :integer, default: 0
    change_column :cars, :brakes, :integer, default: 0
    change_column :cars, :oil_and_filter, :integer, default: 0
    change_column :cars, :spark_plugs_and_ignition, :integer, default: 0
    change_column :cars, :tyres_expired, :integer, default: 96_000
    change_column :cars, :oil_and_filter_expired, :integer, default: 15_000
    change_column :cars, :spark_plugs_and_ignition_expired, :integer, default: 30_000
    change_column :cars, :brakes_expired, :integer, default: 80_000
  end
end
