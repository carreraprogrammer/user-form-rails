# app/views/cities/show.json.jbuilder

json.city do
  json.extract! @city, :id, :name

  json.users @city.users do |user|
    json.partial! 'users/user', user: user
  end
end
