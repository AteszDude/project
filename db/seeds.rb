# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

#user = CreateAdminService.new.call
#puts 'CREATED ADMIN USER: ' << user.email

#User.create!([
#  {name: "aaa", email: "a@a.a", password: "aaaaaa", password_confirmation: "aaaaaa", current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
#  {avatar:'avatar-female.jpg', name: "bbb", email: "b@b.b", password: "aaaaaa", password_confirmation: "aaaaaa", current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
#  {name: "ccc", email: "c@c.c", password: "aaaaaa", password_confirmation: "aaaaaa", current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"}
#])

#Match.create(:person1_id => 1, :person2_id => 2, :time => "2019-02-06 14:02:10")
#Match.create(:person1_id => 1, :person2_id => 3, :time => "2019-02-06 14:02:10")

Faker::Config.random = Random.new(42)

#Admin
  User.create(name: "admin", email: "ateszdude@gmail.com",
  description: Faker::Games::WorldOfWarcraft.quote, sex: 1, match_sex: 2, likes: 1,
  password: "aaaaaa", password_confirmation: "aaaaaa",
  current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1")

#Males
2.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email,
  description: Faker::Games::WorldOfWarcraft.quote, sex: 1, match_sex: 2, likes: rand(1..3),
  password: "aaaaaa", password_confirmation: "aaaaaa",
  current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1")
end

#Females
2.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email,
  description: Faker::Games::WorldOfWarcraft.quote, sex: 2, match_sex: 2, likes: rand(1..3),
  password: "aaaaaa", password_confirmation: "aaaaaa",
  current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1")
end

#100.times do
#  Match.create(:person1_id => rand(1..49), :person2_id => rand(50..99), :time => "2019-02-06 14:02:10")
#end
