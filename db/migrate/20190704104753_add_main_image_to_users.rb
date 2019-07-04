class AddMainImageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :main_image_id, :string
  end
end
