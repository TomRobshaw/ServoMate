class AddTitleToServiceHistory < ActiveRecord::Migration[7.0]
  def change
    add_column :service_histories, :title, :string
  end
end
