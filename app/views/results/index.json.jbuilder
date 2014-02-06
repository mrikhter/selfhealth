json.array!(@results) do |result|
  json.extract! result, :id, :user_test_id, :item_id, :amount
  json.url result_url(result, format: :json)
end
