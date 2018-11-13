class CreateServers < ActiveRecord::Migration[5.2]
  def change
    create_table :servers do |t|
      t.integer :user_id
      t.boolean :approved
      t.string :hostname
      t.string :location
      t.string :environment
      t.string :os_requested
      t.string :disk_size
      t.integer :eng_team_sme_contact_id
      t.integer :eng_team_manager_contact_id
      t.integer :application_sme_id
      t.string :application_team_distro_group
      t.integer :application_manager_id
      t.integer :application_director_id
      t.string :line_of_business
      t.boolean :virtual_machine
      t.string :asset

      t.timestamps
    end
  end
end
