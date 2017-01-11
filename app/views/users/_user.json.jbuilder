json.extract! user, :id, :name, :phone_ext, :email, :password, :admin, :laboratory_id, :created_at, :updated_at
json.url user_url(user, format: :json)