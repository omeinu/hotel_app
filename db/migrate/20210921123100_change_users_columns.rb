class ChangeUsersColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :introduction, :string
    add_column :users, :image, :string
  end
end
