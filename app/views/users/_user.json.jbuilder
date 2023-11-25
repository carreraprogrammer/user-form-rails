json.extract! user, :id, :first_name, :last_name, :birth_date, :email, :gender_id, :address_id, :created_at, :updated_at
json.url user_url(user, format: :json)
