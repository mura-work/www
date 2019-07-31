class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :person_id
      t.integer :book_id
      t.integer :user_id

      t.timestamps
    end
  end
end
