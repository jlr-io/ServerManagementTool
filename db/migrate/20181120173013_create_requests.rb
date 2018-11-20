class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.boolean :edit
      t.boolean :delete
      t.string :comments

      t.timestamps
    end
  end
end
