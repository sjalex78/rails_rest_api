json.extract! user, :id, :name, :dob, :bio, :created_at, :updated_at
json.url user_url(user, format: :json)
