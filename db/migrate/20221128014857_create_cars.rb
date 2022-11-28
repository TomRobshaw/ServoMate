class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :tyres
      t.string :oil_and_filter
      t.string :spark_plugs_and_ignition
      t.string :brakes
      t.integer :kilometers
      t.timestamps
      t.references :user, foreign_key: true
    end
  end
end
