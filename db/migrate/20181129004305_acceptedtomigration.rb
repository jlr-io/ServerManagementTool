class Acceptedtomigration < ActiveRecord::Migration[5.2]
  def change
     add_column :tickets, :accepted, :boolean
  end
end
