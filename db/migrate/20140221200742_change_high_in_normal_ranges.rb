class ChangeHighInNormalRanges < ActiveRecord::Migration
  def self.up
    change_column :normal_ranges, :high,  :real
  end

  def self.down
    change_column :normal_ranges, :high,  :integer
  end
end
