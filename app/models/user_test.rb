class UserTest < ActiveRecord::Base
  belongs_to :user
  belongs_to :test
  belongs_to :laboratory
  has_many :results
end
