# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.create!({ email: "phoebechad@gmail.com", password: "secret", password_confirmation: "secret"})
User.create!({ email: "jon@gmail.com", password: "secret", password_confirmation: "secret"})
User.create!({ email: "ashley@gmail.com", password: "secret", password_confirmation: "secret"})
User.create!({ email: "lori@gmail.com", password: "secret", password_confirmation: "secret"})


new_york = City.create!({
    name: "New York", state: "New York", country: "USA"
})

westfield = City.create!({
    name: "Westfield", state: "New York", country: "USA"
})

boston = City.create!({
    name: "Boston", state: "Massachusetts", country: "USA"
})

bronx = Neighborhood.create!({
    name: "Bronx", city: new_york
})

manhattan = Neighborhood.create!({
    name: "Manhattan", city: new_york
})

soho = Neighborhood.create!({
    name: "Soho", city: new_york
})

north_side = Neighborhood.create!({
    name: "North Side",
    city: westfield
})

south_side = Neighborhood.create!({
    name: "South Side",
    city: westfield
})

bostonu = Neighborhood.create!({
    name: "Boston University", city: boston
})

northeastern = Neighborhood.create!({
    name: "Northeastern", city: boston
})

Apartment.create!({
    street_address: "1564 3rd Avenue E", bedrooms: 3, rent: 3000.00, notes: "Crazy nice kitchen", neighborhood: bronx, city: new_york
})

Apartment.create!({
    street_address: "654 15th Avenue W", bedrooms: 1, rent: 2000.00, notes: "Run down", neighborhood: bronx, city: new_york
})

Apartment.create!({
    street_address: "432 31th Avenue W", bedrooms: 3, rent: 6000.00, notes: "Great neighborhood", neighborhood: soho, city: new_york
})

Apartment.create!({
    street_address: "100 Canal Street", bedrooms: 5, rent: 10000.00, notes: "Large", neighborhood: manhattan, city: new_york
})


Apartment.create!({
    street_address: "200 Sunset Avenue",
    bedrooms: 5,
    rent: 5000.00,
    notes: "Family home",
    neighborhood: north_side,
    city: westfield
})

Apartment.create!({
    street_address: "51 Carol Road",
    bedrooms: 3,
    rent: 6000.00,
    notes: "Close to town",
    neighborhood: north_side,
    city: westfield
})

Apartment.create!({
    street_address: "43 Grove Street",
    bedrooms: 2,
    rent: 3000.00,
    notes: "Bad location",
    neighborhood: south_side,
    city: westfield
})

Apartment.create!({
    street_address: "23 Brownstone Rd",
    bedrooms: 2,
    rent: 3000.00,
    notes: "Big city",
    neighborhood: bostonu,
    city: boston
})

Apartment.create!({
    street_address: "101 Wannamaker Dr",
    bedrooms: 3,
    rent: 4000.00,
    notes: "",
    neighborhood: bostonu,
    city: boston
})

Apartment.create!({
    street_address: "61 Gotham Dr",
    bedrooms: 3,
    rent: 4000.00,
    notes: "",
    neighborhood: northeastern,
    city: boston
})