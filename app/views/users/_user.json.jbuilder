json.extract! user, :id, :first_name, :last_name, :birth_date, :email, :address, :house_or_apartment, :gender_id, :city_id, :country_id, :state_id, :created_at, :updated_at
json.url user_url(user, format: :json)
