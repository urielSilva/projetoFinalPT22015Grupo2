json.array!(@areas) do |area|
  json.extract! area, :id, :name, :sector
  json.url area_url(area, format: :json)
end
