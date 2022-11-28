class AddColumnsToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :make, :string
    add_column :cars, :model, :string
    add_column :cars, :year, :integer
  end
end
