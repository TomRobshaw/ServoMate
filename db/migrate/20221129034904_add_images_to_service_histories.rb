class AddImagesToServiceHistories < ActiveRecord::Migration[7.0]
  def change
    add_column :service_histories, :image, :string
  end
end
