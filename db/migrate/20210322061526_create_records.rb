class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.text :book_name

      t.timestamps
    end
  end
end
