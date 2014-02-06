class CreateUserTests < ActiveRecord::Migration
  def change
    create_table :user_tests do |t|
      t.integer :user_id, :null => false
      t.integer :test_id, :null => false
      t.integer :laboratory_id, :null => false
      t.integer :doctor_id
      t.date :test_date

      t.index :user_id
      t.index :test_id
      t.index :laboratory_id

      t.timestamps
    end
    add_foreign_key :user_tests, :users, :dependent => :destory
    add_foreign_key :user_tests, :tests, :dependent => :destory
    add_foreign_key :user_tests, :laboratories
  end
end
