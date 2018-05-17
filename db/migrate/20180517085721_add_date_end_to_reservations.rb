class AddDateEndToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :date_end, :date
  end
end
