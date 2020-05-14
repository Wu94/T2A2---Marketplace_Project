# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Platform.create(name: "Xbox One")
Platform.create(name: "Xbox 360")
Platform.create(name: "Playstation 4")
Platform.create(name: "Playstation 3")
Platform.create(name: "Nitendo Switch")
Platform.create(name: "Nitendo 3DS")
Platform.create(name: "Nitendo Wii")
Genre.create(name: "Action")
Genre.create(name: "RPG")
Genre.create(name: "MMO")
Genre.create(name: "FPS")