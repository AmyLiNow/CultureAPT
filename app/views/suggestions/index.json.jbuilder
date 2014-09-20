json.array!(@suggestions) do |suggestion|
  json.extract! suggestion, :id
  json.url suggestion_url(suggestion, format: :json)
end
