class Laboratory < ActiveRecord::Base
  has_many :test_items
  has_many :normal_ranges
end
