class CreateNormalRanges < ActiveRecord::Migration
  def change
    create_table :normal_ranges do |t|
      t.integer :item_id, :null => false
      t.string :gender
      t.integer :low_age
      t.integer :high_age
      t.integer :low
      t.integer :high
      t.integer :laboratory_id, :null => false
      t.date :start_date
      t.date :end_date

      t.index :item_id

      t.timestamps
    end
    add_foreign_key :normal_ranges, :items, :dependent => :delete
  end
end
