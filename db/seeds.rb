

amy = User.create!(firstname:  "Amelia",
                  lastname: "Pond",
                  email: "amy@pond.com",
                  password:              "ameliapond",
                  password_confirmation: "ameliapond")

eli = User.create!(firstname:  "Elizabeth",
                   lastname: "Windsor",
                   email: "queen@eli.com",
                   password:              "queeneli",
                   password_confirmation: "queeneli")

jack = User.create!(firstname:  "Jack",
                    lastname: "White",
                    email: "jack@white.com",
                    password:              "jackwhite",
                    password_confirmation: "jackwhite")

morgan = User.create!(firstname:  "Morgan",
                      lastname: "Freeman",
                      email: "morgan@freeman.com",
                      password:              "morganfreeman",
                      password_confirmation: "morganfreeman")

steve = User.create!(firstname:  "Steve",
                     lastname: "Jobs",
                     email: "steve@jobs.com",
                     password:              "stevejobs",
                     password_confirmation: "stevejobs")

zuza = User.create!(firstname:  "Zuzanna",
                    lastname: "Stolinska",
                    email: "zuzanna.st@gmail.com",
                    password:              "zuzannast",
                    password_confirmation: "zuzannast",
                    admin: true)

users = User.all

puts "Users created:" << amy.email, eli.email, jack.email, morgan.email, steve.email
puts "Admin created:" << zuza.email



electronics = Category.create!(name: "Electronics")

Product.create!(title: "Macintosh 128k",
               description: "The first mass-market personal computer featuring an integral graphical user interface and mouse.",
               price: 5200,
               category_id: electronics.id,
               user_id: steve.id)

Product.create!(title: "1950s Kay Guitar",
              description: "Vintage guitar that will bring out the perfect tunes for your compositions.",
              price: 4200,
              category_id: electronics.id,
              user_id: jack.id)

Product.create!(title: "Audio Recorder 3000",
              description: "Perfect recording for your perfect voices. Everything that you need is right here.",
              price: 1500,
              category_id: electronics.id,
              user_id: morgan.id)



books = Category.create!(name: "Books")

Product.create!(title: "The Power: How to rule",
               description: "Do you need an advice in how to rule a country? This book has so much to offer you. When you read it, you suddenly become a part of British royal family. Did you notice the British accent you're already reading this description with? That's the power of the Power.",
               price: 40,
               category_id: books.id,
               user_id: eli.id)

Product.create!(title: "The girl who waited",
              description: "The Eleventh Doctor brings Amy and Rory to the resort planet of Apalapucia, one of the top holiday destinations in the universe. Though he promises views of 'sunsets, spires, and soaring silver colonnades', they step out of the TARDIS to a clinically white room possessing only an exit door with two buttons, labelled 'Green Anchor' and 'Red Waterfall'. While Amy steps back into the TARDIS to retrieve her mobile phone, the Doctor and Rory use the door — pressing the 'Green Anchor' button — and enter another room, which holds a table on which rests a large magnifying glass. When Amy steps back into the corridor, she also uses the door — pressing the 'Red Waterfall' button — and finds herself in a similar-looking room, though Rory and the Doctor are not present. The Doctor and Rory are terrified by the virus. The Doctor activates the time glass and sees Amy. A Handbot enters the room, though, and welcomes the Doctor and Rory to the Two Streams Facility, a 'kindness facility' for victims of Chen-7, the so-called 'one-day plague' which affects two-hearted races — including native Apalapucians and Time Lords.",
              price: 25,
              category_id: books.id,
              user_id: amy.id)



stuff = Category.create!(name: "Stuff")

(1..9).each do |i|
   stuff.products.create!(title: "Stuff #{i}",
                          description: Faker::Lorem.sentence(Random.rand(200)),
                          price: i*10.5,
                          category_id: stuff.id,
                          user_id: users[Random.rand(5)].id)

end

categories = Category.all
products = Product.all


reviews = products.each do |product|
    5.times do
      product.reviews.create!(content: Faker::Lorem.sentence(Random.rand(50)),
                              rating: Random.rand(5)+1,
                              user_id: users[Random.rand(5)].id)
    end
end


puts "Categories created:" << categories.count.to_s
puts "Products created:" << products.count.to_s
puts "Reviews created:" << reviews.count.to_s
