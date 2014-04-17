class Result < ActiveRecord::Base
  belongs_to :user_test
  belongs_to :item

  delegate :full_name, :short_name, :units, :to => :item, :prefix => true

  def item_low_normal_range
    item.low_normal_range
  end

  def item_high_normal_range
    item.high_normal_range
  end

  def out_of_range?
    if amount > item_high_normal_range || amount < item_low_normal_range
      "Out of Range"
    else
      "Normal"
    end
  end

end
