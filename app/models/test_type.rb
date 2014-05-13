class TestType < ActiveRecord::Base
  has_many :tests
  default_scope { order('name') }

end
