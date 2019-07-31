class AddUserIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean, default: 0, null: false
    add_column :users, :introduction, :text
    add_column :users, :image_id, :string
    add_column :users, :career, :text
    add_column :users, :wants, :text
    add_column :users, :skill, :text
    add_column :users, :license, :text
    add_column :users, :hobby, :text
    add_column :users, :main_image_id, :string
    add_column :users, :format, :text
  end
end
