class Result < ActiveRecord::Base
  belongs_to :user_test
  belongs_to :item#, :order => "full_name DESC"

  delegate :full_name, :short_name, :units, :to => :item, :prefix => true

    # scope :ordered, :joins => :item,
    #       :order => "items.full_name ASC"

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
