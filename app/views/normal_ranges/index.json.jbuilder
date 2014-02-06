json.array!(@normal_ranges) do |normal_range|
  json.extract! normal_range, :id, :low, :high, :laboratory_id, :start_date, :end_date, :gender
  json.url normal_range_url(normal_range, format: :json)
end
