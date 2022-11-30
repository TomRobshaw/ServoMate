class AddCoordinatedToGarages < ActiveRecord::Migration[7.0]
  def change
    add_column :garages, :latitude, :float
    add_column :garages, :longitude, :float
  end
end
