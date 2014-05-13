class UserTest < ActiveRecord::Base
  belongs_to :user
  belongs_to :test
  belongs_to :laboratory
  has_many :results, dependent: :destroy
  default_scope { order('test_date DESC') }

  # scope :ordered, -> { order(:test_date)}

  delegate :full_name, :to => :test, :prefix => true
  delegate :name, :to => :laboratory, :prefix => true

  validates :doctor_id, presence: true, numericality: true, :if => :blood_work_test?
  validates :laboratory_id, presence: true, numericality: true, :if => :blood_work_test?

  def blood_work_test?
    test.test_type_name == "Blood Work"
  end

  def items
    test.items
  end
end
