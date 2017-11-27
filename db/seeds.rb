Booking.destroy_all
Listing.destroy_all
User.destroy_all
puts 'hello'
a = User.create!(email: "cook3@cook.com", password: "qwerty", password_confirmation: "qwerty", first_name: "Elliot", surname: "whyte")
b = User.create!(email: "cook4@cook.com", password: "qwerty", password_confirmation: "qwerty", first_name: "Terry", surname: "Rogers")
x = User.create!(email: "cook5@cook.com", password: "qwerty", password_confirmation: "qwerty", first_name: "Harry", surname: "Richards")
y = User.create!(email: "cook6@cook.com", password: "qwerty", password_confirmation: "qwerty", first_name: "Bob", surname: "White")
puts 'hello'


c = Listing.create!(user: a, description: "I am an amazing cook... Trust me!", experience: "5 years", price: 10, speciality: "Birthdays and BBQs", line1: "138 Kingsland Avenue", city: "London", postcode: "EC1N3PU", bookings_completed: 5, dates: "2017-12-01", events: "BBQ", photos: "https://static.pexels.com/photos/357737/pexels-photo-357737.jpeg" )
d = Listing.create!(user: b, description: "I've been a cook for 15 years cooking for friends and family'!", experience: "12 years", price: 5, speciality: "BBQs, Dinner Parties", line1: "145 Kingsland Avenue", city: "London", postcode: "EC1N3PU", bookings_completed: 4, dates: ["2017-12-12"], events: "BBQ", photos: "https://static.pexels.com/photos/11415/befa5c7cfca376be94eddaf5af8d72f6.jpg" )
e = Listing.create!(user: x, description: "I love home cooking, I specialise in Italian cooking'!", experience: "2 years", price: 50, speciality: "BBQs, Dinner Parties", line1: "145 Kingsland Avenue", city: "London", postcode: "EC1N3PU", bookings_completed: 4, dates: ["2017-12-12"], events: "BBQ", photos: "https://static.pexels.com/photos/89235/pexels-photo-89235.png" )
f = Listing.create!(user: y, description: "I'm such a good cook, any dish, you name it, I can make it'!", experience: "8 years", price: 40, speciality: "BBQs, Dinner Parties", line1: "145 Kingsland Avenue", city: "London", postcode: "EC1N3PU", bookings_completed: 4, dates: ["2017-12-12"], events: "BBQ", photos: "https://static.pexels.com/photos/269245/pexels-photo-269245.jpeg" )
puts 'hello'

Booking.create!(listing: c, user: b, booking_date: "Fri, 24 Nov 2017", total_price: 40, duration: 4, status: "pending")
Booking.create!(listing: d, user: a, booking_date: "Fri, 24 Nov 2017", total_price: 50, duration: 5, status: "Complete")
Booking.create!(listing: e, user: y, booking_date: "Fri, 24 Nov 2017", total_price: 100, duration: 5, status: "pending")
Booking.create!(listing: f, user: x, booking_date: "Fri, 24 Nov 2017", total_price: 30, duration: 5, status: "Complete")
puts 'hello'
