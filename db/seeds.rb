

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
               description: "The first mass-market personal computer featuring an integral graphical user interface and mouse. The Macintosh 128K, originally released as the Apple Macintosh, is the original Apple Macintosh personal computer. Its beige case contained a 9 in (23 cm) monitor and came with a keyboard and mouse. A handle built into the top of the case made it easier for the computer to be lifted and carried. It had an initial selling price of $2,495 (equivalent to $5,664 in 2015). The Macintosh was introduced by the now-famous $370,000 ($839,907 today) television commercial by Ridley Scott, 1984, that most notably aired on CBS during the third quarter of Super Bowl XVIII on January 22, 1984.[6] Sales of the Macintosh were strong from its initial release on January 24, 1984, and reached 70,000 units on May 3, 1984.[7] Upon the release of its successor, the Macintosh 512K, it was rebranded as the Macintosh 128K. The centerpiece of the machine was a Motorola 68000 microprocessor running at 7.8336 MHz, connected to 128 KB RAM shared by the processor and the display controller. The boot procedure and some operating system routines were contained in an additional 64 KB ROM chip. Apple did not offer RAM upgrades. The 68000 and video controller took turns accessing DRAM every four CPU cycles during display of the frame buffer, while the 68000 had unrestricted access to DRAM during vertical and horizontal blanking intervals. Such an arrangement reduced the overall performance of the CPU as much as 35% for most codes as the display logic often blocked the CPU's access to RAM. This made the machine appear to run more slowly than several of its competitors, despite the nominally high clock rate.",
               price: 5200,
               category_id: electronics.id,
               user_id: steve.id)

Product.create!(title: "1950s Kay Guitar",
              description: "Vintage guitar that will bring out the perfect tunes for your compositions. A vintage guitar is an older guitar usually sought after and maintained by avid collectors or musicians. While any guitar of sufficient age can be considered a vintage instrument, the term is typically applied to guitars either known for their sound quality or rarity. As early as the 1970s, musicians and collectors began to recognize the value of older instruments. The mass production of both acoustic and electric guitars in that era served to highlight the quality workmanship and materials of the older instruments. Historians, such as George Gruhn, helped to codify both the monetary value and sound quality of these guitars for both collectors and musicians. Examples of well-known vintage electric guitars are 1950s and 1960s era Fender Stratocaster and Telecaster and Gibson Les Paul. Examples of well-known vintage acoustic guitars are Martin and Gibson models typically previous to the 1970s. Although less well-known and not as financially valuable, older electric guitars under the names of Harmony, Danelectro or Kay are becoming increasingly collectible. Vintage acoustic guitars are also collected, including 1930s era Recording Kings, among others.",
              price: 4200,
              category_id: electronics.id,
              user_id: jack.id)

Product.create!(title: "Audio Recorder 3000",
              description: "Perfect recording for your perfect voice. Everything that you need is right here. Sound recording and reproduction is an electrical or mechanical inscription and re-creation of sound waves, such as spoken voice, singing, instrumental music, or sound effects. The two main classes of sound recording technology are analog recording and digital recording. Acoustic analog recording is achieved by a small microphone diaphragm that can detect changes in atmospheric pressure (acoustic sound waves) and record them as a graphic representation of the sound waves on a medium such as a phonograph (in which a stylus senses grooves on a record). In magnetic tape recording, the sound waves vibrate the microphone diaphragm and are converted into a varying electric current, which is then converted to a varying magnetic field by an electromagnet, which makes a representation of the sound as magnetized areas on a plastic tape with a magnetic coating on it. Analog sound reproduction is the reverse process, with a bigger loudspeaker diaphragm causing changes to atmospheric pressure to form acoustic sound waves. Electronically generated sound waves may also be recorded directly from devices such as an electric guitar pickup or a synthesizer, without the use of acoustics in the recording process other than the need for musicians to hear how well they are playing during recording sessions. Digital recording and reproduction converts the analog sound signal picked up by the microphone to a digital form by the process of digitization. This lets the audio data be stored and transmitted by a wider variety of media. Digital recording stores audio as a series of binary numbers representing samples of the amplitude of the audio signal at equal time intervals, at a sample rate high enough to convey all sounds capable of being heard. Digital recordings are considered higher quality than analog recordings not necessarily because they have higher fidelity (wider frequency response or dynamic range), but because the digital format can prevent much loss of quality found in analog recording due to noise and electromagnetic interference in playback, and mechanical deterioration or damage to the storage medium. A digital audio signal must be reconverted to analog form during playback before it is applied to a loudspeaker or earphones.",
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
      product.reviews.create!(content: Faker::Lorem.sentence(Random.rand(20)),
                              rating: Random.rand(5)+1,
                              user_id: users[Random.rand(5)].id)
    end
end


puts "Categories created:" << categories.count.to_s
puts "Products created:" << products.count.to_s
puts "Reviews created:" << reviews.count.to_s
