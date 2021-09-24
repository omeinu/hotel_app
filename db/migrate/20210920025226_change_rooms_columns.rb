class ChangeRoomsColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :image, :string
    remove_column :rooms, :image_name, :string
  end
end
