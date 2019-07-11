class AddPersonNameToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :person_name, :string, foreign_key: true
  end
end
