class ChangeUserTestTable < ActiveRecord::Migration
  def change
    change_column_null(:user_tests, :laboratory_id, true)
  end
end
