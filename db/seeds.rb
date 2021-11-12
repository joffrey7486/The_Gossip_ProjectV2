# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Faker::Config.locale = 'fr'

User.destroy_all
City.destroy_all
Gossip.destroy_all
Comment.destroy_all
Like.destroy_all

# Création de localisations
15.times do |i|
    City.create(
        name: Faker::Fantasy::Tolkien.location,
        zip_code: Faker::Address.zip_code
    )
end
puts "#{City.all.count} localisations"

# Création d'utilisateurs
10.times do |i|
    first_name = Faker::Games::WarhammerFantasy.hero.split.first
    User.create(
        first_name: first_name,
        last_name: Faker::Games::WarhammerFantasy.hero.split.last,
        age: rand(7..77),
        email: "#{first_name}@yopmail.com",
        city: City.all.sample,
        password: '123456'
    )
end
puts "#{User.all.count} utilisateurs"

# Création de potins
20.times do |i|
    Gossip.create(
        title: Faker::Music.album,
        content: Faker::Movies::StarWars.wookiee_sentence,
        user: User.all.sample
    )
end
puts "#{Gossip.all.count} potins"

# Création de commentaires
10.times do |i|
    Comment.create(
        user: User.all.sample,
        gossip: Gossip.all.sample,
        content: Faker::Movies::StarWars.quote
    )
end
puts "#{Comment.all.count} commentaires"

# Création de likes
20.times do |i|
    Like.create(
        user: User.all.sample,
        gossip: Gossip.all.sample
    )
end
puts "#{Like.all.count} likes"



