class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :full_name, :null => false
      t.string :short_name
      t.integer :cpt_code, :null => false

      t.timestamps
    end
  end
end
