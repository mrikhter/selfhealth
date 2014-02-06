class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :user_test_id, :null => false
      t.integer :item_id, :null => false
      t.integer :amount

      t.index :user_test_id
      t.index :item_id
      t.index [:user_test_id, :item_id], :unique => true
      
      t.timestamps
    end
    add_foreign_key :results, :user_tests, :dependent => :destory
    add_foreign_key :results, :items, :dependent => :destory
  end
end
