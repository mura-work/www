class AddFavoritesCountToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :favorites_count, :integer, foreign_key: true
  end
end
