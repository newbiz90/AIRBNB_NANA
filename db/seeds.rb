# db/seeds.rb
require 'faker'
require 'open-uri'

# Create Users with Faker-generated Avatars
host_user = User.create!(
  username: 'host',
  email: 'host@example.com',
  password: 'password',
  # Add any other user attributes as needed
)
host_user.photo.attach(io: URI.open(Faker::Avatar.image(slug: host_user.email, size: '300x300', format: 'png')), filename: 'avatar.png')

guest_user = User.create!(
  username: 'guest',
  email: 'guest@example.com',
  password: 'password',
  # Add any other user attributes as needed
)
guest_user.photo.attach(io: URI.open(Faker::Avatar.image(slug: guest_user.email, size: '300x300', format: 'png')), filename: 'avatar.png')

# Create Listings
listing1 = Listing.create!(
  title: 'Beautiful House',
  description: 'A lovely place to stay.',
  price: 100.0,
  user: host_user,
  availability: true
  # Add any other listing attributes as needed
).tap do |listing|
  listing.photos.attach(io: URI.open('https://source.unsplash.com/random/airbnb'), filename: 'house.jpg')
end

listing2 = Listing.create!(
  title: 'Cozy Apartment',
  description: 'Perfect for a short stay.',
  price: 75.0,
  user: host_user,
  availability: true
  # Add any other listing attributes as needed
).tap do |listing|
  listing.photos.attach(io: URI.open('https://source.unsplash.com/random/airbnb'), filename: 'house.jpg')
end

# Create Bookings
booking1 = Booking.create!(
  user: guest_user,
  listing: listing1,
  start_date: Date.today + 1,
  end_date: Date.today + 5
  # Add any other booking attributes as needed
)

# Create the review for the booking
review1 = Review.create!(
  user: guest_user,
  booking: booking1,
  rating: 5,
  content: 'A wonderful stay!'
)

# Create the review for the booking
review2 = Review.create!(
  user: guest_user,
  booking: booking1,
  rating: 2,
  content: 'A bad stay!'
)

booking2 = Booking.create!(
  user: guest_user,
  listing: listing2,
  status: 'confirmed',
  start_date: Date.today + 7,
  end_date: Date.today + 10
  # Add any other booking attributes as needed
)

review3 = Review.create!(
  user: guest_user,
  booking: booking2,
  rating: 5,
  content: 'An awful stay!'
)

puts 'Seed data created successfully!'
