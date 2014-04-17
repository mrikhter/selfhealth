class User < ActiveRecord::Base
  attr_accessor :password
  has_many :user_tests, dependent: :destroy
  has_many :tests, :through => :user_tests

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, confirmation: true

  before_save :set_age
  before_save :encrypt_password

  scope :ordered, order("last_name")

  def full_name
    # first_name.nil? && last_name.nil? ? nil : [first_name, last_name].compact.join(" ")
    [first_name, last_name].compact.join(" ")
  end

  private
    def set_age
      self.age = age_calc
    end

    def age_calc
      (Date.current - dob).to_i/365
    end

    def encrypt_password
      if password.present?
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
      end
    end

    def self.authenticate(email, password)
      user = find_by_email(email)
      if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
        user
      else
        nil
      end
    end
end
