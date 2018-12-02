class Removal < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :edit_server
    remove_column :tickets, :delete_server
  end
end
