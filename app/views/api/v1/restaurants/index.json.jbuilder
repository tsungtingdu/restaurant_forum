json.data do
  json.array! @restaurants do |restaurant|
    json.(restaurant, :id, :name, :address, :description)
  end
end 