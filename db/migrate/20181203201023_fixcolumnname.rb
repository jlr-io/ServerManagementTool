class Fixcolumnname < ActiveRecord::Migration[5.2]
  def change
    rename_column :systems, :memory, :machine
  end
end
