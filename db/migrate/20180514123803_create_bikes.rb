class CreateBikes < ActiveRecord::Migration[5.2]
  def change
    create_table :bikes do |t|
      t.string :category
      t.text :description
      t.string :title
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
