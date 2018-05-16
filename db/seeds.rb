
# créer au moins un user qui possède les vélos



User.destroy_all
Bike.destroy_all
Reservation.destroy_all
puts "all distroy"




puts "create"
users = []


users << 10.times do User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  phone_number: Faker::PhoneNumber.phone_number,
  email: Faker::Internet.email,
  # pictures: Faker::Avatar.image,
  password: "123456"
  )
end


pictures = [
"https://images.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.decouvriruzes.fr%2Fwp-content%2Fuploads%2F2013%2F02%2Fvelo-femme.jpg&f=1",
"https://www.amsterdamair.fr/14332-thickbox_default/velo-hollandais-double-dutch-low-premium.jpg",
"https://www.cyclable.com/wp-content/uploads/2015/11/velo-enfant-peugeot-retro-l.png",
"http://megabike.follow-us.eu/wp-content/uploads/2013/11/velo-electra-delivery-3i.jpg",
"http://p6.storage.canalblog.com/60/30/1079252/82569330_o.jpg"
]

20.times do Bike.create!(
  title: Faker::Book.title,
  category: Bike::CATEGORIES,
  user: users[rand(0..9)],
  description: Faker::ChuckNorris.fact,
  remote_photo_url: pictures.sample
)
end

puts "seed ok"







