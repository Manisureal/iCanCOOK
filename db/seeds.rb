User.create!(email: "cook3@cook.com", password: "qwerty", password_confirmation: "qwerty", first_name: "Han", surname: "solo")
User.create!(email: "cook4@cook.com", password: "qwerty", password_confirmation: "qwerty", first_name: "Kane", surname: "Black")

Listing.create!(user_id: 1, description: "I am an amazing cook... Trust me!", experience: "10 years", price: 10, speciality: "Birthdays and BBQs", line1: "138 Kingsland Avenue", city: "London", postcode: "EC1N3PU", bookings_completed: 5, dates: "2017-12-01", events: "BBQ" )
Listing.create!(user_id: 2, description: "I am an amazing cook... Trust is the Key!", experience: "12 years", price: 12, speciality: "BBQs, Dinner Parties", line1: "145 Kingsland Avenue", city: "London", postcode: "EC1N3PU", bookings_completed: 4, dates: "2017-12-12", events: "BBQ" )

Booking.create!(listing_id: 1, user_id: 1, booking_date: "Fri, 24 Nov 2017", total_price: 40, duration: 4, status: "pending")
Booking.create!(listing_id: 2, user_id: 2, booking_date: "Fri, 24 Nov 2017", total_price: 50, duration: 5, status: "pending")
