class CreateModifications < ActiveRecord::Migration[5.2]
  def change
    create_table :modifications do |t|
      t.integer :user_id
      t.integer :server_id
      t.boolean :edit_server
      t.boolean :delete_server
      t.text :comments

      t.timestamps
    end
  end
end
