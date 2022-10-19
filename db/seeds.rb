# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

madera = Hotspot.create!(name: "Madera Canyon", county: "Santa Cruz",
rank: 1, accessible: false)
dove = madera.birds.create!(name: "Mourning Dove", behavior: "feeding",
quantity: 3, raptor: false)
trogon = madera.birds.create!(name: "Elegant Trogon", behavior: "calling",
quantity: 1, raptor: false)
vulture = madera.birds.create!(name: "Turkey Vulture", behavior: "soaring",
quantity: 7, raptor: true)

sweet = Hotspot.create!(name: "Sweetwater Wetlands", county: "Pima",
rank: 2, accessible: true)
cooper = sweet.birds.create!(name: "Cooper's Hawk", behavior: "soaring",
quantity: 1, raptor: true)
black = sweet.birds.create!(name: "Red-winged Blackbird", behavior: "resting",
quantity: 20, raptor: false)
coot = sweet.birds.create!(name: "American Coot", behavior: "wading",
quantity: 12, raptor: false)

creek = Hotspot.create!(name: "Turkey Creek Trail", county: "Cochise",
rank: 3, accessible: true)
gray = creek.birds.create!(name: "Gray Hawk", behavior: "hunting",
quantity: = 1, raptor: true)
cedar = creek.birds.create!(name: "Cedar Waxwing", behavior: "feeding",
quantity: = 2, raptor: false)
sharp = creek.birds.create!(name: "Sharp-shinned Hawk", behavior: "resting",
quantity: = 1, raptor: true)
