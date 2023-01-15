json.extract! employee, :id, :name, :status, :branch_id, :costcenter_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
