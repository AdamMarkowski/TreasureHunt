json.array!(@tokens) do |token|
  json.extract! token, :id, :token
  json.url token_url(token, format: :json)
end
