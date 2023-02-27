class CreateCats < ActiveRecord::Migration[7.0]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :pickup_address
      t.integer :angriness_level
      t.integer :fluffiness
      t.string :color
      t.references :user, null: false, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end
