class AddAdminIdToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :admin_id, :integer
  end
end
