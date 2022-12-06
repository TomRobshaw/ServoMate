class ChangeCarPartsFromStringToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :cars, :tyres, :integer, using: 'tyres::integer'
    change_column :cars, :brakes, :integer, using: 'brakes::integer'
    change_column :cars, :oil_and_filter, :integer, using: 'oil_and_filter::integer'
    change_column :cars, :spark_plugs_and_ignition, :integer, using: 'spark_plugs_and_ignition::integer'
  end
end
