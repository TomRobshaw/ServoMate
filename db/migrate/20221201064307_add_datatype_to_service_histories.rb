class AddDatatypeToServiceHistories < ActiveRecord::Migration[7.0]
  def change
    remove_column :service_histories, :date
    add_column :service_histories, :service_date, :date
  end
end
