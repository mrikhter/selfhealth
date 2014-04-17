class ChangeLowInNormalRanges < ActiveRecord::Migration
  def self.up
    change_column :normal_ranges, :low,  :real
  end

  def self.down
    change_column :normal_ranges, :low,  :integer
  end
end
