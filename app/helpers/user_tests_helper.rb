module UserTestsHelper

  def user_test_test_types(user)
    user.user_tests.group_by { |user_test| user_test.test.test_type }.sort
  end

  def user_test_tests(user_tests)
    user_tests.group_by { |user_test| user_test.test }.sort
  end

  # def user_test_test_types(user)
    # user.user_tests.collect { |user_test| user_test.test.test_type }.flatten.uniq.sort
  # end
  # [#<TestType id: 1, name: "Blood Work", created_at: "2014-04-22 19:57:18", updated_at: "2014-04-22 19:57:18">, #<TestType id: 2, name: "General", created_at: "2014-05-09 17:32:59", updated_at: "2014-05-09 17:32:59">]

  # def user_test_tests(user, test_type)
  #   user.user_tests.where(:test_type => test_type)

  # end
end
