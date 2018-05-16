class AddAddressToBikes < ActiveRecord::Migration[5.2]
  def change
    add_column :bikes, :address, :string
  end
end
