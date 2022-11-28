class AddAddressToGarage < ActiveRecord::Migration[7.0]
  def change
    add_column :garages, :address, :string
  end
end
