class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :test_id, :null => false
      t.string :full_name, :null => false
      t.string :short_name
      t.boolean :depends_on_age, :null => false
      t.boolean :depends_on_gender, :null => false
      t.string :units, :null => false

      t.index :test_id
      

      t.timestamps
    end
    add_foreign_key :items, :tests, :dependent => :delete
  end
end
