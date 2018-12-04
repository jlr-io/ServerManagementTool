class AddColumnsToSystem < ActiveRecord::Migration[5.2]
  def change
    add_column :systems, :kernel, :string
    add_column :systems, :platform, :string
    add_column :systems, :model, :string
    add_column :systems, :ncore, :string
    add_column :systems, :cpu_model, :string
    add_column :systems, :cpu_speed, :string
    add_column :systems, :disk, :string
    add_column :systems, :memory, :string
    add_column :systems, :os, :string
  end
end
