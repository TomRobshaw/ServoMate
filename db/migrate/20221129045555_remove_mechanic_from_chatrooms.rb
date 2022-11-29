class RemoveMechanicFromChatrooms < ActiveRecord::Migration[7.0]
  def change
    remove_column :chatrooms, :mechanic, :string
  end
end
