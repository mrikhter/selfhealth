class Item < ActiveRecord::Base
  belongs_to :test
  belongs_to :laboratory
  has_many :normal_ranges, dependent: :destroy
  has_many :results

  def low_normal_range
    normal_ranges.first.low
  end

  def high_normal_range
    normal_ranges.first.high
  end

end
