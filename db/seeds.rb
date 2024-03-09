# db/seeds.rb
require 'faker'
require 'open-uri'

User.destroy_all
Listing.destroy_all
Booking.destroy_all

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
)

listing2 = Listing.create!(
  title: 'Cozy Apartment',
  description: 'Perfect for a short stay.',
  price: 75.0,
  user: host_user,
  availability: true
  # Add any other listing attributes as needed
)

# Create Bookings
booking1 = Booking.create!(
  user: guest_user,
  listing: listing1,
  start_date: Date.today + 1,
  end_date: Date.today + 5
  # Add any other booking attributes as needed
)

booking2 = Booking.create!(
  user: guest_user,
  listing: listing2,
  start_date: Date.today + 7,
  end_date: Date.today + 10
  # Add any other booking attributes as needed
)

puts 'Seed data created successfully!'
