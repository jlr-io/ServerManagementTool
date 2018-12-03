class Change < ActiveRecord::Migration[5.2]
  def change
    rename_column :tickets, :modification_type, :ticket_type
  end
end
