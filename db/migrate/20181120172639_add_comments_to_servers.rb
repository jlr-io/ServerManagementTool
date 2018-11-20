class AddCommentsToServers < ActiveRecord::Migration[5.2]
  def change
    add_column :servers, :comments, :string
  end
end
