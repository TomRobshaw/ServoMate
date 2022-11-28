class CreateServiceHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :service_histories do |t|
      t.references :booking, foreign_key: true
      t.timestamps
    end
  end
end
