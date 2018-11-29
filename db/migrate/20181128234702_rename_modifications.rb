class RenameModifications < ActiveRecord::Migration[5.2]
  def change
     rename_table :modifications, :tickets
  end
end
