class RemoveColumnMailToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :mail
  end
end
