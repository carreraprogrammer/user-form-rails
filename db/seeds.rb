
# Crear Géneros
Gender.create!([{ description: 'Masculino' }, { description: 'Femenino' }])

# Países
colombia = Country.create!(name: "Colombia")

# Estados y ciudades para Colombia
states_cities = {
  "Antioquia" => ["Medellín", "Envigado", "Itagüí"],
  "Valle del Cauca" => ["Cali", "Buenaventura", "Palmira"],
  "Cundinamarca" => ["Bogotá", "Soacha", "Zipaquirá"],
  "Santander" => ["Bucaramanga", "Barrancabermeja", "San Gil"],
  "Bolívar" => ["Cartagena", "Magangué", "Turbaco"],
  "Atlántico" => ["Barranquilla", "Soledad", "Malambo"],
  "Nariño" => ["Pasto", "Tumaco", "Ipiales"],
  "Córdoba" => ["Montería", "Sincelejo", "Lorica"],
  "Magdalena" => ["Santa Marta", "Ciénaga", "Fundación"],
  "Tolima" => ["Ibagué", "Espinal", "Honda"]
}

states_cities.each do |state_name, cities|
  state = State.create!(name: state_name, country: colombia)
  cities.each do |city_name|
    City.create!(name: city_name, state: state)
  end
end

puts "Seeds creados con éxito."


city = City.find_by(name: 'Medellín')
3.times do |i|
  User.create!(
    first_name: "User",
    last_name: "#{i + 1}",
    birth_date: "1990-01-01",
    email: "user#{i + 1}@example.com",
    address: "Address #{i + 1}",
    house_or_apartment: "House",
    gender: Gender.first,
    city: city,
    country: colombia,
    state: State.find_by(name: 'Antioquia')
  )
end

puts "Seeds creados con éxito."
