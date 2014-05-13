class ChangeCptCodeInTests < ActiveRecord::Migration
  def change
    change_column_null(:tests, :cpt_code, true)
  end
end
