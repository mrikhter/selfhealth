class Test < ActiveRecord::Base
  has_many :items, dependent: :destroy
  default_scope { order('full_name') }

  
  belongs_to :test_type
  delegate :name, :to => :test_type, :prefix => true

  validates :cpt_code, presence: true, numericality: true, uniqueness: true, :if => :blood_work_test?

  def blood_work_test?
    test_type_name == "Blood Work"
  end

  # def to_param
  #   if test_type_name == "Blood Work"
  #     "#{cpt_code}"
  #   else
  #     "#{test_type_name}"
  #   end
  # end
end
