class AddFormatToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :format, :text
  end
end
