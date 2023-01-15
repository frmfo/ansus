json.extract! vehicle, :id, :fleet, :name, :brand, :plate, :status, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
