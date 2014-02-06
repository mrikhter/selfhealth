json.array!(@user_tests) do |user_test|
  json.extract! user_test, :id, :user_id, :test_id, :laboratory_id, :doctor_id, :test_date
  json.url user_test_url(user_test, format: :json)
end
