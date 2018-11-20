class CreateSystems < ActiveRecord::Migration[5.2]
  def change
    create_table :systems do |t|
      t.integer :server_id
      t.string :system
      t.string :machine
      t.string :cpu
      t.string :graphics
      t.string :drives
      t.string :ip
      t.string :boot_time
      t.string :date

      t.timestamps
    end
  end
end
