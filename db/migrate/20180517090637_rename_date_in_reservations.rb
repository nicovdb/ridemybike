class RenameDateInReservations < ActiveRecord::Migration[5.2]
  def change
    rename_column :reservations, :date, :date_begin
  end
end
