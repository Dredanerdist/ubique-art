# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html


###### Roles
["admin", "user"].each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
end
###### User
### Max
max = User.find_or_create_by_email :name => "Max Mustermann", :email => "admin@example.com", :password => "admin1234", :password_confirmation => "admin1234"
max.confirm!
max.add_role :admin

### Peter
peter = User.find_or_create_by_email :name => "Peter Maier", :email => "peter@example.com", :password => "admin1234", :password_confirmation => "admin1234"
peter.confirm!
peter.add_role :user

###### Artist Profiles
ap1 = ArtistProfile.find_or_create_by_vita vita: "Peter hatte ein schweres Leben..."
peter.artist_profile = ap1
peter.save


###### Painting
p1 = Painting.find_or_create_by_name name: "Mona Lisa", description: "Ein schönes Gemälde"
p1.artist_profile = peter.artist_profile
p1.save

###### Tag Category
tc1 = TagCategory.find_or_create_by_name name: "Farbe"

###### Tags
t1 = Tag.find_or_create_by_name name: "Rot"
t1.tag_category = tc1
t1.save
p1.tags << t1
p1.save
t2 = Tag.find_or_create_by_name name: "Blau"
t2.tag_category = tc1
t2.save

###### Like
max.liked_paintings << p1
max.save

###### Spots
s1 = Spot.find_or_create_by_name name: "Grünfutter", capacity: 2, address: "Beselerallee 1", zip: 24118, city: "Kiel"
s1.user = max
s1.save

###### Painting at Spot
pas1 = PaintingAtSpot.find_or_create_by_from_date from_date: DateTime.new(2013,3,10), to_date: DateTime.new(2013,4,15)
pas1.spot = s1
pas1.painting = p1
pas1.save

max.scans << pas1
max.save

