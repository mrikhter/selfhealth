json.array!(@tests) do |test|
  json.extract! test, :id, :full_name, :short_name, :cpt_code
  json.url test_url(test, format: :json)
end
