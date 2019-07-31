class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|

      t.timestamps
    end
  end
end
