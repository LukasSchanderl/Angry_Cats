berlin_address = [
  "Strausberger Pl. 79",
  "Saarbrücker Str. 82",
  "Karl-Liebknecht-Str. 15",
  "Auguststraße 58",
  "Am Zwirngraben 43",
  "Große Präsidentenstraße 28",
  "Am Kupfergraben 69",
  "Schendelgasse 50",
  "Kleine Hamburger Str. 56",
  "Gerichtstraße 67",
  "Segelfliegerdamm 22",
  "Leopoldstraße 52",
  "Lützowplatz 77",
  "Alexanderstraße 60",
  "Kleine Hamburger Str. 56",
  "Rosenthaler Str. 54",
  "Große Hamburger Str. 46",
  "Potsdamer Straße 58",
  "Rathausstraße 32",
  "Lindenstraße 44",
  "Genslerstraße 29",
  "Rosenthaler Str. 31"
]

require "open-uri"
require "faker"

puts "Cleaning database..."
Cat.destroy_all
User.destroy_all

puts "Creating database..."

# result = Cloudinary::Api.resources_by_tag('cats')
# puts result["resources"][i]["asset_id"]
# result = Cloudinary::Api.resources[0]

15.times do
  user = User.create(
    password: "123456",
    email: Faker::Internet.email
  )
end

i = 0

15.times do
  cat = Cat.new(
    address: "#{berlin_address[i]}, Berlin",
    name: Faker::Creature::Cat.name,
    angriness_level: Faker::Number.within(range: 1..5),
    fluffiness: Faker::Number.within(range: 1..5),
    color: Faker::Color.color_name,
    price: Faker::Number.decimal(l_digits: 2),
    # description: Faker::Quotes::Shakespeare.hamlet_quote,
    description: "In a small town, a cat came hiding in people's homes and people named it kitty. Kitty used to come to everyone's house and drink milk and sometimes eat food. People slowly started getting worried about this.
    People thought of catching the kitty. For this, they laid a trap for the kitty.
    At night, Kitty went out in search of her food but she fell into that trap. After being caught in the trap, she was kept in captivity for several days.
    Kitty screamed fondly, 'meow meow meow meow'
    Seeing Kitty upset, a girl named Lily thought of taking care of her and making her a pet. Lily brought Kitty to her home and put a ringing bell around her neck.
    When Kitty moves her bell sounds, 'ting ting ting'.
    Lily would give good food to the kitty every day and also give her milk. But Kitty enjoyed going to others' homes to eat stolen food.
    Kitty started to go out at night and went to the others' houses. But now she gets nothing. People would hide the food after hearing the sound of her ringing the bell. Whatever the kitty tries, she does not get anything.
    In such a situation, Kitty enlisted the help of her friend Rat. The rat bit the kitty's bell with his tooth. Rat helped kitty to get rid of a ringing bell.
    Now the kitty was free again. People no longer know when the kitty comes and goes. Now Kitty is smarter than ever.",
  )
  cat.photo.attach(io: URI.open("https://cataas.com/cat"), filename: "test")
  cat.user = User.all[i]
  cat.save!

  i += 1
end

puts "Finished!"

# i = 0




# 20.times do
#   cat = Cat.new(
#     name: Faker::Creature::Cat.name,
#     pickup_address: berlin_address[i],
#     angriness_level: Faker::Number.within(range: 1..5),
#     fluffiness: Faker::Number.within(range: 1..5),
#     color: Faker::Color.color_name,
#     price: Faker::Number.decimal(l_digits: 2)
#   )

#   cat.photos.attach(photos_array.sample)
#   cat.photo.attach()
#   cat.photo.attach()
#   cat.photo.attach()
#   cat.save
#   i += 1
# end

# # name
# Faker::Creature::Cat.name
# #address

# #photo
# "https://cataas.com/cat"

# #fluffiness
# Faker::Number.within(range: 1..5)
# #color
# Faker::Color.color_name
# #price
# Faker::Number.decimal(l_digits: 2)

# #USERS

# #email
# Faker::Internet.email
# #BOOKINGS

# #start date
# Faker::Date.between(from: '2022-01-23', to: '2022-03-31')
# #end date
# Faker::Date.between(from: '2022-02-01', to: '2022-04-01')
