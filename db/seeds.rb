# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#CATS

# name
Faker::Creature::Cat.name
#address
Strausberger Pl. 79
Saarbrücker Str. 82
Karl-Liebknecht-Str. 15
Auguststraße 58
Am Zwirngraben 43
Große Präsidentenstraße 28
Am Kupfergraben 69
Schendelgasse 50
Kleine Hamburger Str. 56
Gerichtstraße 67
Segelfliegerdamm 22
Leopoldstraße 52
Lützowplatz 77
Alexanderstraße 60
Kleine Hamburger Str. 56
Rosenthaler Str. 54
Große Hamburger Str. 46
Potsdamer Straße 58
Rathausstraße 32
Lindenstraße 44
Genslerstraße 29
Rosenthaler Str. 31

#photo
https://cataas.com/cat

#fluffiness
Faker::Number.within(range: 1..5)
#color
Faker::Color.color_name
#price
Faker::Number.decimal(l_digits: 2)

#USERS

#email
Faker::Internet.email
#BOOKINGS

#start date
Faker::Date.between(from: '2022-01-23', to: '2022-03-31')
#end date
Faker::Date.between(from: '2022-02-01', to: '2022-04-01')
