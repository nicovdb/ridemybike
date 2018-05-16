class RemoveColumnAddressToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column  :users, :address
    remove_column :users, :latitude
    remove_column :users, :longitude
  end
end
