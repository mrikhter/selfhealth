json.array!(@laboratories) do |laboratory|
  json.extract! laboratory, :id, :name
  json.url laboratory_url(laboratory, format: :json)
end
