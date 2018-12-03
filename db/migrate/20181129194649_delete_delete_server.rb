class DeleteDeleteServer < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :delete_server
  end
end
