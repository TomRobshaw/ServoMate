class CreateChatrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :chatrooms do |t|
      t.string :mechanic
      t.references :user, foreign_key: true
      t.references :garage, foreign_key: true

      t.timestamps
    end
  end
end
