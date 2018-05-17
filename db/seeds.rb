
# créer au moins un user qui possède les vélos

Reservation.destroy_all
User.destroy_all
Bike.destroy_all

puts "all destroy"




puts "create"


portraits = [
  "http://www.keatleyphoto.com/wp-content/uploads/2016/05/IMG_2589.jpg",
  "https://www.soyacincau.com/wp-content/uploads/2017/10/171019-google-pixel-2-portrait-mode-large-12.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/2/23/Manzanar_portrait_Toyo_Miyatake_00100u.jpg",
  "https://neunzehn72.de/wp-content/uploads/2015/04/PL1_7525-NIKON-D810-1-500-Sek.-bei-f-14-ISO-200.jpg",
  "http://playnowstudios.com/wp-content/uploads/2014/09/3571_1studio_portrait_photography_25.jpg",
  "https://www.georgedeloache.com/portraits_files/vlb_images1/100627_0167_3a.jpg",
  "https://esamhassanyehdotcom.files.wordpress.com/2015/11/sadhu-varansi-6.jpg",
  "https://i.pinimg.com/736x/f4/40/49/f44049cf8438a971104d481ce14b11ca--maria-luisa-sexy-girls.jpg",
  "http://www.dfki.de/wwdata//Portrait_Photos/Portrait_Wahlster_Photo_by_Jim_Rakete.jpg",
  "http://a141.idata.over-blog.com/3/18/55/60/portraits-noir-blanc/coluche.jpg"
]

10.times do User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  phone_number: Faker::PhoneNumber.phone_number,
  email: Faker::Internet.email,
  photo: portraits.sample,
  password: "123456"
  )
end

address = [
  "160 avenue du général de gaulle, 17430 Tonnay-Charente",
  "19 quai des Chartrons 33000 Bordeaux",
  "17 Rue Tiquetonne, 75002 Paris",
  "9 Rue Constantine, 69001 Lyon",
  "34 Quai du Port, 13002 Marseille",
  "10 Boulevard du Prince de Galles, 64200 Biarritz",
  "23 Avenue la Fayette, 17300 Rochefort",
  "83 Quai des Chartrons, 33300 Bordeaux",
  "10 Place du Marché Chartrons, 33000 Bordeaux",
  "15 Rue Rode, 33000 Bordeaux",
  "174 Cours du Médoc, 33300 Bordeaux",
  "5 Passage Ruelle, 75018 Paris",
  "27 Rue de Condé, 75006 Paris",
  "25 Rue Villiot, 75012 Paris"
]

pictures = [
"https://images.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.decouvriruzes.fr%2Fwp-content%2Fuploads%2F2013%2F02%2Fvelo-femme.jpg&f=1",
"https://www.amsterdamair.fr/14332-thickbox_default/velo-hollandais-double-dutch-low-premium.jpg",
"https://www.cyclable.com/wp-content/uploads/2015/11/velo-enfant-peugeot-retro-l.png",
"http://megabike.follow-us.eu/wp-content/uploads/2013/11/velo-electra-delivery-3i.jpg",
"http://p6.storage.canalblog.com/60/30/1079252/82569330_o.jpg"
]

users = User.all

40.times do Bike.create!(
  title: Faker::Book.title,
  category: Bike::CATEGORIES.sample,
  user: users.sample,
  description: Faker::ChuckNorris.fact,
  address: address.sample,
  remote_photo_url: pictures.sample
)
end

puts "seed ok"







