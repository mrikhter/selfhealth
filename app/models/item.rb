class Item < ActiveRecord::Base
  belongs_to :test
  belongs_to :laboratory
  has_many :normal_ranges
  has_many :results

end
