class AddTestTypeToTests < ActiveRecord::Migration
  def change
    add_column :tests, :test_type_id, :integer
    add_foreign_key :tests, :test_types

    Test.all.each do |test|
      test.test_type_id = 1
      test.save
    end

    change_column_null(:tests, :test_type_id, true)
    
  end
end
