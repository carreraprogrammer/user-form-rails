json.extract! user, :id, :first_name, :last_name, :birth_date, :email, :address, :house_or_apartment, :created_at, :updated_at
json.city user.city.name if user.city
json.state user.city.state.name if user.city && user.city.state
json.country user.city.state.country.name if user.city && user.city.state && user.city.state.country
json.gender user.gender.description if user.gender
json.url user_url(user, format: :json)
