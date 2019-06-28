class AddPesonIdToBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :person, foreign_key: true
  end
end
