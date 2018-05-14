class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :bike, foreign_key: true
      t.date :date
      t.string :status
      t.integer :rating

      t.timestamps
    end
  end
end
