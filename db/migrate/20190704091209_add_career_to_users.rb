class AddCareerToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :career, :text
    add_column :users, :wants, :text
    add_column :users, :skill, :text
    add_column :users, :license, :text
    add_column :users, :hobby, :text
  end
end
