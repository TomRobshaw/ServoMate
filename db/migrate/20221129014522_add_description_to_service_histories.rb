class AddDescriptionToServiceHistories < ActiveRecord::Migration[7.0]
  def change
    add_column :service_histories, :description, :string
  end
end
