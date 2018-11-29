class AddComplete < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :complete, :boolean
  end
end
