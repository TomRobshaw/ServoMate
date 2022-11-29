class AddDateToServiceHistory < ActiveRecord::Migration[7.0]
  def change
    add_column :service_histories, :date, :string
  end
end
