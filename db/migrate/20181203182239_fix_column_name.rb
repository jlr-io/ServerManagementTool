class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :systems, :memory, :machine
  end
end
