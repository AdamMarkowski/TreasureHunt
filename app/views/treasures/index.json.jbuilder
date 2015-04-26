json.array!(@treasures) do |treasure|
  json.extract! treasure, :id, :longtitude, :latitude
  json.url treasure_url(treasure, format: :json)
end
