class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :introduction
      t.integer :price
      t.string :address
      t.string :image_name

      t.timestamps
    end
  end
end
