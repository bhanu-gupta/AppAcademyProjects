# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bench.destroy_all

bench1 = Bench.create!({description: 'Mission Loft', lat: 37.761159, lng: -122.418950})
bench2 = Bench.create!({description: 'The Barlett Hotel and Guesthouse', lat: 37.786582, lng: -122.408534})
bench3 = Bench.create!({description: 'Hilton', lat: 37.786291, lng: -122.410470})
bench4 = Bench.create!({description: 'Omni Hotel', lat: 37.793650, lng: -122.402166})
bench5 = Bench.create!({description: 'Hyatt Regency', lat: 37.794701, lng: -122.394590})
