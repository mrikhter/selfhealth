class Result < ActiveRecord::Base
  belongs_to :user_test
  belongs_to :item

  def out_of_range?(result)
    if result.amount > result.item.normal_ranges.first.high || result.amount < result.item.normal_ranges.first.low
      "Out of Range"
    else
      "Normal"
    end
  end

end
