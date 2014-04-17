class Test < ActiveRecord::Base
  has_many :items, dependent: :destroy

  validates :cpt_code, presence: true, numericality: true

  def to_param
    "#{cpt_code}"
  end
end
