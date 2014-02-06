class User < ActiveRecord::Base
  has_many :user_tests
  has_many :tests, :through => :user_tests

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  before_save :set_age
  
  def full_name
    first_name.nil? && last_name.nil? ? nil : [first_name, last_name].compact.join(" ")
  end

  private
    def set_age
      self.age = age_calc
    end

    def age_calc
      (Date.current - dob).to_i/365
    end
end
