class Removecolums < ActiveRecord::Migration[5.2]
  def change
    remove_column :systems, :system
    remove_column :systems, :machine
    remove_column :systems, :cpu
    remove_column :systems, :graphics
    remove_column :systems, :drives
    remove_column :systems, :date
  end
end
