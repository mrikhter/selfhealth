json.array!(@items) do |item|
  json.extract! item, :id, :test_id, :full_name, :short_name, :depends_on_age, :depends_on_gender, :units
  json.url test_item_url(item, format: :json)
end
